# Sistema de dormir

El sistema de dormir ajusta dinámicamente `players_sleeping_percentage` para que el servidor no exija dormir al 100% de los jugadores activos. La referencia práctica es simple: si hay cuatro jugadores activos, basta uno; si hay ocho, bastan dos; si hay doce, bastan tres.

## Objetivo

- Escala con el número de jugadores presentes en el Overworld.
- Excluye a los jugadores AFK del conteo de activos.
- Se recalcula cada tick.
- Mantiene el resultado dentro del rango válido del gamerule.
- Evita pedir un durmiente extra por redondeos internos de vanilla.

## Archivos involucrados

| Archivo | Función |
|---|---|
| `qol/function/minecraft/load.mcfunction` | Carga el sistema de calidad de vida |
| `qol/function/minecraft/tick.mcfunction` | Ejecuta el sistema de vehículos y el de dormir |
| `qol/function/sleep/admin/load.mcfunction` | Crea el scoreboard de cálculo y constantes |
| `qol/function/sleep/admin/tick.mcfunction` | Llama al cálculo cada tick |
| `qol/function/sleep/calculate.mcfunction` | Calcula el porcentaje final |
| `qol/function/sleep/apply_macro.mcfunction` | Aplica el gamerule con macro |

## Relacionado

- [Introducción a QOL](../qol.md)
- [Sistema TR](../tr.md)
- [TR: equipos y presencia](../tr/equipos.md)
- [Tótems personalizados](../totems.md)

## Carga

En `qol:sleep/admin/load` se crea el scoreboard `sleep_calc` y se cargan constantes como fake players:

```mcfunction
scoreboard objectives add sleep_calc dummy
scoreboard players set var_by_four sleep_calc 4
scoreboard players set var_percent_base sleep_calc 100
scoreboard players set var_mod_two sleep_calc 2
scoreboard players set var_bump_min sleep_calc 10
```

Esas constantes no cambian durante la partida. Se guardan como fake players porque los scoreboards no operan con literales en operaciones aritméticas.

## Cálculo

### 1. Conteo de jugadores

- `var_overworld_total`: jugadores no espectadores en el Overworld.
- `var_overworld_active`: jugadores no espectadores en el Overworld que no están en `AFK_OVERWORLD`.

La diferencia entre ambos valores es intencional:

- `total` representa el tamaño real del grupo que puede afectar al ciclo noche/día.
- `active` representa quién realmente cuenta para decidir cuánta gente debe dormir.

### 2. Durmientes necesarios

La fórmula base es:

```text
sleepers_needed = ceil(overworld_active / 4)
```

Como los scoreboards trabajan con enteros, se usa:

```text
ceil(a / 4) = floor((a + 3) / 4)
```

Eso significa que el sistema nunca necesita números decimales ni aproximaciones flotantes. Todo queda en aritmética entera reproducible.

Ejemplos útiles:

| Activos | Necesarios |
|---|---|
| 1 | 1 |
| 2 | 1 |
| 3 | 1 |
| 4 | 1 |
| 5 | 2 |
| 8 | 2 |
| 9 | 3 |

### 3. Corrección adicional

Si `active >= 10` y `active mod 4 == 2`, se añade un durmiente extra. Esa corrección evita un desfase en algunos tamaños de grupo.

La corrección existe porque el salto entre porcentaje mostrado y conteo real no siempre cae exactamente donde uno esperaría al traducir fracciones a enteros. En la práctica, corrige un caso estrecho sin complicar todo el algoritmo.

### 4. Conversión a porcentaje

El porcentaje final se calcula como:

```text
sleep_percent = floor(sleepers_needed * 100 / overworld_total)
```

Se usa `floor` de forma intencional para no pedir un durmiente extra por redondeo interno de vanilla.

Esto produce resultados estables y fáciles de razonar, aunque el valor final del gamerule no siempre sea una fracción “bonita”. Lo importante es el comportamiento observado en juego.

## Casos borde

- Si no hay nadie en el Overworld, el porcentaje queda en `100`.
- Si hay jugadores activos pero `sleepers_needed` queda en `0`, se fuerza a `1`.
- El valor final se clampa al rango válido de `1` a `100`.

### Sin jugadores en el Overworld

En ese escenario no tiene sentido rebajar el requisito. El sistema deja el gamerule en `100` para no tocar el ciclo cuando no hay nadie afectado.

### Grupo activo mínimo

Si hay jugadores activos, siempre debe haber al menos un durmiente requerido. Ese mínimo evita estados inconsistentes donde el sistema calcularía cero y rompería la intención de juego.

### Clamp final

Los límites protegen frente a divisiones raras o configuraciones futuras. Aunque el algoritmo ya intenta mantener todo en rango, el clamp final es la última barrera de seguridad.

## Aplicación del gamerule

El valor final se guarda en `storage qol:sleep` y se aplica con una macro:

```mcfunction
$gamerule players_sleeping_percentage $(value)
```

La macro se usa porque el comando final necesita recibir el valor ya resuelto y `players_sleeping_percentage` no se puede enlazar directamente a un scoreboard sin pasar por esta fase intermedia.

## Integración con AFK

El sistema depende de `AFK_OVERWORLD`, porque ese equipo excluye a los jugadores AFK del cálculo de activos. El orden de ejecución garantiza que `tr` actualice primero los equipos y luego `qol` ejecute el cálculo.

En términos de diseño, esto evita castigar a un grupo activo por jugadores que están presentes pero no disponibles para dormir.