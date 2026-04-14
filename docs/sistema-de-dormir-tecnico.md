# 🔬 Sistema de Dormir — Documentación Técnica

> **Datapack:** The Reminiscence SMP v1.8.1 · **Namespace:** `qol`

---

## Índice

1. [Propósito y motivación](#1-propósito-y-motivación)
2. [Archivos involucrados](#2-archivos-involucrados)
3. [Fase de carga (load)](#3-fase-de-carga-load)
4. [Fase de tick (tick)](#4-fase-de-tick-tick)
5. [Algoritmo de cálculo detallado](#5-algoritmo-de-cálculo-detallado)
   - [Conteo de jugadores](#51-conteo-de-jugadores)
   - [Cálculo de durmientes necesarios](#52-cálculo-de-durmientes-necesarios)
   - [Bump correction (calibración)](#53-bump-correction-calibración)
   - [Cálculo del porcentaje](#54-cálculo-del-porcentaje)
   - [Casos borde y clamp](#55-casos-borde-y-clamp)
6. [Aplicación del gamerule (macro)](#6-aplicación-del-gamerule-macro)
7. [Integración con el sistema AFK](#7-integración-con-el-sistema-afk)
8. [Tabla de resultados completa](#8-tabla-de-resultados-completa)
9. [Justificación matemática](#9-justificación-matemática)

---

## 1. Propósito y motivación

En un servidor SMP con muchos jugadores simultáneos, el requisito vanilla de que el 100 % duerma para pasar la noche es muy restrictivo. Este sistema reemplaza ese requisito de forma **dinámica**:

- Escala automáticamente con el número de jugadores en línea.
- Excluye a jugadores AFK para no penalizar a los activos.
- Solo afecta al **Overworld** (única dimensión donde el ciclo día/noche importa).
- El cálculo se refresca **cada tick**, por lo que los cambios en la población online son inmediatos.

---

## 2. Archivos involucrados

| Archivo | Función |
|---------|---------|
| `qol/function/minecraft/load.mcfunction` | Llama a `qol:sleep/admin/load` |
| `qol/function/minecraft/tick.mcfunction` | Llama a `qol:vehicle_speeds/admin/tick` y a `qol:sleep/admin/tick` |
| `qol/function/sleep/admin/load.mcfunction` | Crea el scoreboard `sleep_calc` y sus constantes |
| `qol/function/sleep/admin/tick.mcfunction` | Invoca `qol:sleep/calculate` cada tick |
| `qol/function/sleep/calculate.mcfunction` | Lógica completa del cálculo (50+ líneas) |
| `qol/function/sleep/apply_macro.mcfunction` | Aplica el gamerule con la técnica de macros |

---

## 3. Fase de carga (load)

**`qol:sleep/admin/load`** crea el scoreboard de cálculo y precarga las constantes como fake players:

```mcfunction
scoreboard objectives add sleep_calc dummy

scoreboard players set var_by_four       sleep_calc 4
scoreboard players set var_percent_base  sleep_calc 100
scoreboard players set var_mod_two       sleep_calc 2
scoreboard players set var_bump_min      sleep_calc 10
```

Usar fake players para las constantes evita el uso de literales numéricos en operaciones de scoreboards, ya que la instrucción `scoreboard players operation` solo trabaja con objetivos, no con literales.

---

## 4. Fase de tick (tick)

**`qol:sleep/admin/tick`** simplemente invoca el cálculo:

```mcfunction
function qol:sleep/calculate
```

No hay ninguna condición de entrada; el cálculo se ejecuta **cada tick** sin excepción, garantizando que el gamerule esté siempre actualizado.

---

## 5. Algoritmo de cálculo detallado

### 5.1 Conteo de jugadores

```mcfunction
# Resetear contadores
scoreboard players set var_overworld_total  sleep_calc 0
scoreboard players set var_overworld_active sleep_calc 0

# Total: no-espectadores en el Overworld
execute as @a[gamemode=!spectator] at @s
  if dimension minecraft:overworld
  run scoreboard players add var_overworld_total sleep_calc 1

# Activos: no-espectadores en Overworld que NO están en el equipo AFK_OVERWORLD
execute as @a[gamemode=!spectator, team=!AFK_OVERWORLD] at @s
  if dimension minecraft:overworld
  run scoreboard players add var_overworld_active sleep_calc 1
```

**`var_overworld_total`** — todos los jugadores no-espectadores en el Overworld (incluidos AFK).  
**`var_overworld_active`** — jugadores no-espectadores en el Overworld que **no** pertenecen al equipo `AFK_OVERWORLD`.

> El equipo `AFK_OVERWORLD` es gestionado por el namespace `tr` y asigna a los jugadores que han activado `/trigger afk` mientras están en el Overworld.

---

### 5.2 Cálculo de durmientes necesarios

La fórmula objetivo es:

```
sleepers_needed = ceil(overworld_active / 4)
```

Los scoreboards solo operan con enteros y **división entera** (floor). Para implementar `ceil(a / b)` con división entera se usa la identidad:

```
ceil(a / b) = floor((a + b - 1) / b)
```

En este caso `b = 4`, entonces `b - 1 = 3`:

```mcfunction
# Solo calcular si hay al menos un jugador en Overworld
execute if score var_overworld_total sleep_calc matches 1.. run {
  scoreboard players operation var_sleepers_needed sleep_calc = var_overworld_active sleep_calc
  scoreboard players add var_sleepers_needed sleep_calc 3           # + (b-1) = +3
  scoreboard players operation var_sleepers_needed sleep_calc /= var_by_four sleep_calc  # /4
}
```

Ejemplos de resultado:

| active | active + 3 | ÷ 4 (floor) | = needed |
|--------|-----------|-------------|---------|
| 1 | 4 | 1 | 1 |
| 2 | 5 | 1 | 1 |
| 4 | 7 | 1 | 1 |
| 5 | 8 | 2 | 2 |
| 8 | 11 | 2 | 2 |
| 12 | 15 | 3 | 3 |

---

### 5.3 Bump correction (calibración)

Se aplica una corrección especial cuando se cumplen **ambas** condiciones:
- `var_overworld_active >= 10`
- `var_overworld_active % 4 == 2`

```mcfunction
# Calcular active % 4
scoreboard players operation var_active_mod_four sleep_calc = var_overworld_active sleep_calc
scoreboard players operation var_active_mod_four sleep_calc %= var_by_four sleep_calc

# Si active >= 10 y active % 4 == 2, añadir 1 durmiente extra
execute if score var_overworld_active sleep_calc matches 10..
  if score var_active_mod_four sleep_calc = var_mod_two sleep_calc
  run scoreboard players add var_sleepers_needed sleep_calc 1
```

**¿Por qué?** Con la fórmula `ceil(a/4)`, los valores `a = 10, 14, 18, 22, 26...` (es decir, `a mod 4 == 2` con `a >= 10`) producen un `needed` que, al convertirse en porcentaje y redondearse internamente por vanilla, puede quedar un durmiente corto. La corrección añade 1 para compensar este sesgo.

Sin corrección, con `active = 10`, `needed = ceil(10/4) = 3`. El porcentaje calculado sería `floor(3*100/total)`. Si, por ejemplo, `total = 10`, el porcentaje quedaría `30`. Vanilla internamente usa `ceil(percentage * players / 100)` = `ceil(0.3 * 10)` = `3`. Pero el objetivo era que con 10 activos bastaran 3 (no 4), así que sin bump el resultado es correcto en este caso. La corrección ajusta casos donde el redondeo de vanilla pediría un durmiente adicional de forma inesperada.

---

### 5.4 Cálculo del porcentaje

El gamerule `playersSleepingPercentage` acepta un valor de **1 a 100**. La conversión de `sleepers_needed` a porcentaje se hace con:

```
sleep_percent = floor(sleepers_needed * 100 / overworld_total)
```

El uso de `floor` es **intencional**: vanilla internamente aplica `ceil(percentage * players / 100)` para determinar el número real de durmientes necesarios. Usar `floor` aquí garantiza que el resultado de vuelta nunca pida un durmiente más del que calculamos.

```mcfunction
scoreboard players operation var_sleepers_scaled sleep_calc = var_sleepers_needed sleep_calc
scoreboard players operation var_sleepers_scaled sleep_calc *= var_percent_base sleep_calc  # × 100
scoreboard players operation var_sleep_percent sleep_calc = var_sleepers_scaled sleep_calc
scoreboard players operation var_sleep_percent sleep_calc /= var_overworld_total sleep_calc  # ÷ total
```

---

### 5.5 Casos borde y clamp

#### Nadie en el Overworld

```mcfunction
execute if score var_overworld_total sleep_calc matches ..0
  run scoreboard players set var_sleep_percent sleep_calc 100
```

Si `total = 0`, se mantiene `100%` para no afectar ningún ciclo de día sin jugadores presentes.

#### Ningún jugador activo pero sí hay jugadores

```mcfunction
execute if score var_overworld_active sleep_calc matches 1..
  if score var_sleepers_needed sleep_calc matches ..0
  run scoreboard players set var_sleepers_needed sleep_calc 1
```

Garantiza que siempre se exija al menos 1 durmiente mientras haya algún jugador activo.

#### Clamp final

```mcfunction
execute if score var_sleep_percent sleep_calc matches ..0   run scoreboard players set var_sleep_percent sleep_calc 1
execute if score var_sleep_percent sleep_calc matches 101.. run scoreboard players set var_sleep_percent sleep_calc 100
```

Limita el porcentaje al rango válido `[1, 100]` antes de aplicarlo.

---

## 6. Aplicación del gamerule (macro)

El resultado de `var_sleep_percent` se guarda en el data storage `qol:sleep` como entero y se pasa a una función macro:

```mcfunction
# En calculate.mcfunction:
execute store result storage qol:sleep value int 1
  run scoreboard players get var_sleep_percent sleep_calc

function qol:sleep/apply_macro with storage qol:sleep
```

**`qol:sleep/apply_macro`:**

```mcfunction
$gamerule playersSleepingPercentage $(value)
```

La línea comienza con `$`, lo que la convierte en una **macro function** (introducidas en 1.20.2). El valor `$(value)` se sustituye en tiempo de ejecución con el entero almacenado en `storage qol:sleep value`.

> Esta técnica es necesaria porque `gamerule` no acepta scoreboards directamente como argumento. La única alternativa sería un `execute store result game_rule`, pero no existe para `playersSleepingPercentage`. Las macros son la solución limpia sin usar `data get` + `scoreboard players store`.

---

## 7. Integración con el sistema AFK

El sistema de dormir depende directamente del sistema de equipos del namespace `tr`:

```
tr:admin/update_teams (cada tick)
  └─ assign AFK players → AFK_OVERWORLD / AFK_NETHER / AFK_END

qol:sleep/calculate (cada tick)
  └─ @a[team=!AFK_OVERWORLD] → no cuentan como activos
```

**Orden de ejecución:** en el tick, `tr:minecraft/tick` se ejecuta **antes** que `qol:minecraft/tick` (según `tick.json`). Esto garantiza que cuando el cálculo de dormir se ejecuta, los equipos AFK ya están actualizados.

---

## 8. Tabla de resultados completa

La tabla muestra `sleep_percent` (el valor del gamerule) para distintas combinaciones de jugadores activos y totales:

| active | total | needed (raw) | bump? | needed (final) | sleep_percent |
|--------|-------|-------------|-------|----------------|---------------|
| 1 | 1 | 1 | No | 1 | 100 |
| 1 | 2 | 1 | No | 1 | 50 |
| 2 | 2 | 1 | No | 1 | 50 |
| 2 | 3 | 1 | No | 1 | 33 |
| 4 | 4 | 1 | No | 1 | 25 |
| 4 | 5 | 1 | No | 1 | 20 |
| 5 | 5 | 2 | No | 2 | 40 |
| 8 | 8 | 2 | No | 2 | 25 |
| 8 | 10 | 2 | No | 2 | 20 |
| 10 | 10 | 3 | Sí (+1) | 4 | 40 |
| 12 | 12 | 3 | No | 3 | 25 |
| 14 | 14 | 4 | No | 4 | 28 |
| 16 | 16 | 4 | No | 4 | 25 |
| 20 | 20 | 5 | No | 5 | 25 |
| 0 | — | — | — | — | 100 |

> Para la mayoría de configuraciones de jugadores, el porcentaje resultante se acerca al **25%**, lo que equivale a "1 de cada 4 jugadores activos".

---

## 9. Justificación matemática

### ¿Por qué `floor` al calcular el porcentaje?

Minecraft internamente convierte el gamerule a un conteo real con:

```
required = ceil(playersSleepingPercentage × players / 100)
```

Si calculáramos el porcentaje con `ceil` en lugar de `floor`, podríamos pasar un valor ligeramente mayor, y vanilla aplicaría `ceil` sobre ese valor mayor, pidiendo **un durmiente más** del necesario.

Usando `floor` garantizamos que:

```
ceil(floor(needed * 100 / total) * total / 100) ≤ needed
```

Es decir, vanilla nunca pedirá más durmientes de los que hemos calculado.

### ¿Por qué excluir AFK de activos pero no del total?

- **Excluir de activos:** un jugador AFK no puede dormir activamente, por lo que no tiene sentido contarlo como alguien que "podría ir a dormir". Incluirlo inflaría el denominador de la fracción de dormir.
- **Incluir en el total:** el total `overworld_total` se usa para dividir el producto `needed × 100`. Si excluyéramos a los AFK del total también, el porcentaje resultante podría llegar al 100% o más en escenarios con muchos jugadores AFK, lo que anularía completamente la funcionalidad.

El diseño actual maximiza la experiencia: un servidor con 20 jugadores en total, de los cuales 15 están activos y 5 están AFK, solo necesitará `ceil(15/4) = 4` durmientes, representando `floor(4*100/20) = 20%`.
