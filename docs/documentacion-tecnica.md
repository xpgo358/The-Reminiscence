# 🛠️ The Reminiscence SMP — Documentación Técnica

> **Versión:** v1.8.1 · **Minecraft:** 1.21.11 · **Pack Format:** 101 (mínimo 101.1)

---

## Índice

1. [Estructura del datapack](#1-estructura-del-datapack)
2. [Ciclo de vida: load y tick](#2-ciclo-de-vida-load-y-tick)
3. [Namespace `tr` — Sistema SMP principal](#3-namespace-tr--sistema-smp-principal)
   - [Scoreboards y triggers](#31-scoreboards-y-triggers)
   - [Sistema de equipos (teams)](#32-sistema-de-equipos-teams)
   - [Lógica de tick principal](#33-lógica-de-tick-principal)
   - [Selector de color HEX](#34-selector-de-color-hex)
   - [Challenges](#35-challenges)
   - [Fallback functions](#36-fallback-functions)
4. [Namespace `qol` — Calidad de vida](#4-namespace-qol--calidad-de-vida)
   - [Sistema de dormir](#41-sistema-de-dormir)
   - [Velocidades de vehículos](#42-velocidades-de-vehículos)
5. [Namespace `totems` — Tótems personalizados](#5-namespace-totems--tótems-personalizados)
   - [Sistema de detección](#51-sistema-de-detección)
   - [Lista completa de tótems](#52-lista-completa-de-tótems)
6. [Referencia de scoreboards](#6-referencia-de-scoreboards)
7. [Referencia de teams](#7-referencia-de-teams)
8. [Referencia de archivos](#8-referencia-de-archivos)

---

## 1. Estructura del datapack

```
Datapack/
├── pack.mcmeta              # Metadatos (formato 101, descripción)
├── spyglass.json            # Versión de juego objetivo: 1.21.11
└── data/
    ├── minecraft/
    │   └── tags/function/
    │       ├── load.json    # Enlaza los tres puntos de carga
    │       └── tick.json    # Enlaza los tres puntos de tick
    ├── tr/                  # Namespace principal del SMP
    ├── qol/                 # Calidad de vida
    └── totems/              # Tótems personalizados
```

### Puntos de entrada

**`data/minecraft/tags/function/load.json`**
```json
{ "values": ["tr:minecraft/load", "totems:minecraft/load", "qol:minecraft/load"] }
```

**`data/minecraft/tags/function/tick.json`**
```json
{ "values": ["tr:minecraft/tick", "totems:minecraft/tick", "qol:minecraft/tick"] }
```

El orden de ejecución en cada fase es `tr` → `totems` → `qol`.

---

## 2. Ciclo de vida: load y tick

### Al cargar el datapack (`load`)

| Namespace | Acción |
|-----------|--------|
| `tr` | Programa animación de carga (10 pasos, 0.5 s cada uno). Luego borra y recrea scoreboards y equipos. |
| `totems` | Crea los scoreboards de detección de tótem. |
| `qol` | Crea el scoreboard `sleep_calc` con sus constantes. |

### Cada tick (`tick`)

| Namespace | Acción |
|-----------|--------|
| `tr` | Inicializa jugadores nuevos, sincroniza equipos, procesa todos los triggers. |
| `totems` | Detecta tótems en mano, actualiza contadores, lanza mensajes al usarlos. |
| `qol` | Recalcula el porcentaje de sueño; aplica velocidades de vehículo. |

---

## 3. Namespace `tr` — Sistema SMP principal

### 3.1 Scoreboards y triggers

#### Scoreboards de estado (dummy)

| Objetivo | Tipo | Descripción |
|----------|------|-------------|
| `prank-level` | dummy | Nivel de pranks actual del jugador (0–5) |
| `recording-status` | dummy | 0 = no grabando, 1 = grabando |
| `streaming-status` | dummy | 0 = no en directo, 1 = en directo |
| `afk-status` | dummy | 0 = activo, 1 = AFK |
| `color-step` | dummy | Paso actual del selector de color (0–7) |
| `color-d1`…`color-d6` | dummy | Valor numérico (0–15) de cada dígito hex |
| `leave` | `minecraft.custom:minecraft.leave_game` | Detecta cuando un jugador abandona y vuelve a unirse |
| `health` | health | Vida del jugador, mostrada en el marcador de jugadores (TAB) |

#### Triggers

| Objetivo | Uso |
|----------|-----|
| `afk` | `/trigger afk` → activa/desactiva AFK (toggle) |
| `prank` | `/trigger prank set <0-5>` → establece nivel de pranks |
| `streaming` | `/trigger streaming` → activa/desactiva streaming (toggle) |
| `recording` | `/trigger recording` → activa/desactiva grabación (toggle) |
| `help` | `/trigger help` → muestra ayuda en el chat |
| `rules` | `/trigger rules` → muestra reglas del servidor |
| `version` | `/trigger version` → muestra versión (solo si AFK+prank3+streaming+recording activos) |
| `color` | `/trigger color` → inicia selector de color |
| `colorpick` | `/trigger colorpick set <0-15>` → elige un dígito hex (usado internamente) |

> **Nota:** Todos los triggers se reinician a `-1` cada tick y se rehabilitan para todos los jugadores, garantizando que siempre estén disponibles.

---

### 3.2 Sistema de equipos (teams)

#### Equipos AFK (3 teams)

Los jugadores con `afk-status=1` son asignados al equipo de su dimensión actual:

| Team | Dimensión | Sufijo |
|------|-----------|--------|
| `AFK_OVERWORLD` | `minecraft:overworld` | `⌀ ☀` (gris + verde oscuro) |
| `AFK_NETHER` | `minecraft:the_nether` | `⌀ 🔥` (gris + rojo oscuro) |
| `AFK_END` | `minecraft:the_end` | `⌀ ✦` (gris + morado oscuro) |

#### Equipos de estado (24 teams)

Se generan todas las combinaciones de:
- **Nivel de prank:** 0–5 (6 valores)
- **Recording:** 0 o 1 (2 valores)
- **Streaming:** 0 o 1 (2 valores)

Nomenclatura: `t_p{prank}_r{recording}_s{streaming}`

Ejemplos:
- `t_p0_r0_s0` → prank 0, sin grabar, sin streaming → sufijo `⓪` gris
- `t_p3_r1_s1` → prank 3, grabando y en streaming → sufijo `③ ● ●` (dorado, rojo, morado)
- `t_p5_r0_s1` → prank 5, solo streaming → sufijo `⑤ ●` (rojo oscuro, morado)

Los sufijos tienen tooltips al pasar el cursor, explicando el significado de cada indicador.

#### Asignación de equipos (`update_teams`)

Esta función se ejecuta **cada tick**:
1. Saca a todos los jugadores de sus equipos actuales (`team leave @a`).
2. Reasigna cada jugador al equipo correcto según sus scoreboards.
3. AFK tiene prioridad: si `afk-status=1`, se asigna al AFK de su dimensión y no a ningún equipo de estado.

---

### 3.3 Lógica de tick principal

**Archivo:** `tr:minecraft/tick`

Flujo de ejecución por tick:

```
1. Inicialización de jugadores nuevos (tag !update1)
   └─ Establece prank-level=0, recording/streaming/afk-status=0
   └─ Añade tag update1 para no repetirlo

2. Sincronización de equipos
   └─ tr:admin/update_teams

3. Procesamiento de triggers
   └─ tr:control/triggers
      ├─ AFK: detecta cambio en score afk → actualiza afk-status → anuncia → actualiza teams
      ├─ Prank: copia score prank → prank-level
      ├─ Streaming: detecta cambio → actualiza streaming-status → anuncia → actualiza teams
      ├─ Recording: detecta cambio → actualiza recording-status → anuncia → actualiza teams
      ├─ Color: inicia selector si color >= 0, procesa pasos si color-step=1..6
      ├─ Help: muestra mensaje de ayuda extendido
      ├─ Rules: muestra reglas del servidor
      └─ Version: muestra versión (requiere afk+prank3+streaming+recording activos)

4. Mensaje de bienvenida
   └─ Si score leave >= 1 → tr:control/join_message → reset leave=0

5. Reset y rehabilitación de todos los triggers para el siguiente tick
```

#### Detección de toggle (AFK, Streaming, Recording)

El mecanismo de toggle funciona así:

```mcfunction
# Si el jugador acaba de activar el trigger (score >= 0) y el status era 0
execute as @a[scores={afk=0..,afk-status=0}] run tag @s add tr_afk_on

# Si el jugador acaba de activar el trigger y el status era 1
execute as @a[scores={afk=0..,afk-status=1}] run tag @s add tr_afk_off
```

Los tags `tr_afk_on` / `tr_afk_off` se aplican en el mismo tick, se procesan y se eliminan, sin dejar rastro.

---

### 3.4 Selector de color HEX

**Trigger de inicio:** `/trigger color`  
**Función de inicio:** `tr:control/color/start`

Flujo completo:

```
start
 ├─ Resetea color-step=1, color-d1..d6=-1
 ├─ Limpia storage tr:color selected
 └─ Muestra menú (menu)
    └─ tellraw con "Paso X/6"
    └─ preview_macro: muestra el color construido hasta ahora
    └─ Botones clickeables [0]–[F] (16 opciones, dos líneas)

pick (cuando colorpick >= 0 y color-step=1..6)
 ├─ Copia colorpick → color-dX según el paso actual
 ├─ store_hex_digit: almacena en storage tr:color selected.dX el carácter hex ("0"–"F")
 ├─ Muestra "OK" verde
 ├─ Incrementa color-step
 └─ Si color-step = 7 → confirm
    Si color-step <= 6 → menu

confirm
 └─ confirm_macro with storage tr:color selected
    └─ Muestra preview del color final
    └─ Botones [Confirmar] y [Rehacer]

apply (cuando color-step=7 y colorpick=1)
 └─ apply_macro with storage tr:color selected
    └─ $execute as @s run waypoint modify @s color hex $(d1)$(d2)$(d3)$(d4)$(d5)$(d6)
    └─ Resetea color-step=0
    └─ Muestra "Color aplicado" verde
```

**Técnica de macros:** se usa `data modify storage` para construir una cadena de texto hex que luego se inyecta en el comando `waypoint modify` mediante la sintaxis de macros (`$`).

**`store_hex_digit`:** para cada combinación de (paso × valor numérico), establece el string correspondiente en el storage (por ejemplo, `colorpick=10` → `"A"`). Son 6 pasos × 16 valores = 96 líneas de `execute if score … run data modify storage`.

---

### 3.5 Challenges

**Función:** `tr:admin/challenges/new`

Cuando un operador ejecuta esta función, se lanza una animación dramática en 10 pasos (un paso cada 0.5 s) que incluye:

- Títulos y action bars con el texto "Cargando Challenges."
- Sonido de ráfaga del Wither (`entity.wither.spawn`) al 50% de pitch
- Título final "☠ NUEVO CHALLENGE ☠" (rojo oscuro, 1 s de entrada, 5 s de mostrado, 1 s de salida)
- Subtítulo: "Mira Discord para más información"
- Action bar: "Courtesy of TR"

---

### 3.6 Fallback functions

Funciones de administrador para establecer estados manualmente cuando los triggers no son accesibles:

| Función | Equivalente a |
|---------|--------------|
| `tr:fallback/prank/0` … `tr:fallback/prank/5` | `/trigger prank set 0..5` |
| `tr:fallback/streaming/on` | Activar streaming |
| `tr:fallback/streaming/off` | Desactivar streaming |
| `tr:fallback/recording/on` | Activar grabación |
| `tr:fallback/recording/off` | Desactivar grabación |

---

## 4. Namespace `qol` — Calidad de vida

### 4.1 Sistema de dormir

Véase la [Documentación Técnica del Sistema de Dormir](./sistema-de-dormir-tecnico.md) para un análisis exhaustivo.

**Resumen:** calcula dinámicamente `playersSleepingPercentage` para que solo necesite dormir aproximadamente `ceil(activos / 4)` jugadores. Los jugadores AFK en el Overworld son excluidos del cálculo de activos.

### 4.2 Velocidades de vehículos

**Tick dispatcher:** `qol:vehicle_speeds/admin/tick`

Llama a tres funciones cada tick:
- `qol:vehicle_speeds/happyghast`
- `qol:vehicle_speeds/pig`
- `qol:vehicle_speeds/strider`

#### Lógica por vehículo

Cada función sigue el mismo patrón:

```mcfunction
# 1. Eliminar el modificador de TODOS los entidades del tipo
execute as @e[type=minecraft:pig] run attribute @s minecraft:movement_speed modifier remove qol:everything_on_a_stick_boost

# 2. Añadir el modificador solo si un jinete tiene el ítem en mano
execute as @a[nbt={RootVehicle:{Entity:{id:"minecraft:pig"}}}]
  if items entity @s weapon.* minecraft:clock[item_model="everything_on_a_stick"]
  on vehicle
  run attribute @s minecraft:movement_speed modifier add qol:everything_on_a_stick_boost 0.1 add_value
```

El modificador se elimina y se reañade cada tick, lo que garantiza que:
- Se aplica solo mientras el jinete tiene el ítem.
- Se elimina inmediatamente al soltar el ítem o desmontar.
- No se acumulan modificadores duplicados.

#### Valores de boost

| Entidad | Atributo | Valor `add_value` |
|---------|----------|-------------------|
| `minecraft:pig` | `minecraft:movement_speed` | `0.1` |
| `minecraft:strider` | `minecraft:movement_speed` | `0.1` |
| `minecraft:happy_ghast` | `minecraft:flying_speed` | `0.025` |

#### Receta del ítem

**Tipo:** `minecraft:crafting_shapeless`  
**Grupo:** ninguno (categoría: misc)

| Ingrediente |
|-------------|
| `minecraft:warped_fungus` |
| `minecraft:snowball` |
| `minecraft:carrot` |
| `minecraft:fishing_rod` |

**Resultado:**  
- ID: `minecraft:clock`  
- `item_name`: "Everything on a Stick"  
- `item_model`: `everything_on_a_stick`  
- `lore`: texto bilingüe (inglés y español)

---

## 5. Namespace `totems` — Tótems personalizados

### 5.1 Sistema de detección

#### On load

`totems:minecraft/load`:
1. Llama a `totems:admin/create_scoreboards` (crea los objetivos).
2. Llama a `totems:give_recipes` (desbloquea todas las recetas para todos los jugadores).

#### Scoreboards

| Objetivo | Tipo | Descripción |
|----------|------|-------------|
| `used_totem` | `minecraft.used:minecraft.totem_of_undying` | Se incrementa cuando el juego consume un tótem (salvación de muerte) |
| `used_jann`, `used_manchas`, … | dummy | Contador de 3 ticks por tótem por jugador |

#### Tick por tótem (en `totems:minecraft/tick` → `totems:use_totem`)

Para cada uno de los 30 tótems se repite el siguiente bloque:

```mcfunction
# 1. Detectar presencia en mano principal
execute as @a if items entity @s weapon.mainhand minecraft:totem_of_undying[item_model="addy_jann"]
  run scoreboard players set @s used_jann 3

# 2. Detectar presencia en mano secundaria
execute as @a if items entity @s weapon.offhand minecraft:totem_of_undying[item_model="addy_jann"]
  run scoreboard players set @s used_jann 3

# 3. Decrementar contador cada tick
execute as @a if score @s used_jann matches 1..
  run scoreboard players remove @s used_jann 1

# 4. Mostrar mensaje cuando el tótem se ha usado (used_totem=1 + used_jann >= 1)
execute as @a[scores={used_totem=1, used_jann=1..}]
  run tellraw @a [...]
```

**¿Por qué el contador de 3 ticks?** El scoreboard `used_totem` se incrementa en el tick en que el juego consume el tótem. El contador de 3 ticks garantiza que `used_jann >= 1` todavía esté activo cuando se evalúa la condición `used_totem=1`, ya que el incremento de vanilla puede resolverse en un orden diferente al de las funciones del datapack.

**`used_totem`** es un scoreboard de criterio `minecraft.used:minecraft.totem_of_undying`, que se incrementa automáticamente por el juego cuando un jugador sobrevive gracias al tótem.

### 5.2 Lista completa de tótems

| Archivo de receta | Nombre del tótem | Jugador | Ingrediente adicional |
|-------------------|-----------------|---------|----------------------|
| `addy_jann` | Jann | Addy | `minecraft:snowball` |
| `adiac_manchas` | Manchas | Adiac | `minecraft:blue_egg` |
| `belbio_kiki` | Kiki | Belbio | `minecraft:armadillo_scute` |
| `boom_tnt` | TNT | Boom | `minecraft:gunpowder` |
| `cluc_mixu` | Mixu | Cluc | `minecraft:iron_nugget` |
| `crisho_totem` | Old Totem | Crisho | `minecraft:dandelion` + `minecraft:gold_ingot` |
| `dalox_azalea` | Azalea | Dalox | `minecraft:flowering_azalea` |
| `ernesto_fiona` | Fiona | Ernesto | `minecraft:beef` |
| `estela_star` | Star | Estela | `minecraft:glowstone_dust` |
| `isma_fail` | Critical Fail | Isma | `minecraft:copper_nugget` |
| `jolyne_laser` | Laser | Jolyne | `minecraft:porkchop` |
| `karen_thor` | Thor | Karen | `minecraft:wind_charge` |
| `kris_knight` | The Knight | Kris | `minecraft:honey_bottle` |
| `laura_burbuja` | Burbuja | Laura | `minecraft:redstone` |
| `lu_lala` | Lala | Lu | `minecraft:medium_amethyst_bud` |
| `mati_yuki` | Yuki | Mati | `minecraft:amethyst_shard` |
| `melklyth_escarchita` | Escarchita | Melklyth | `minecraft:carrot` |
| `nebluno_neri` | Neri | Nebluno | `minecraft:feather` |
| `pamme_rich` | Rich | Pamme | `minecraft:wither_rose` |
| `phavern_ralsei` | Ralsei | Phavern | `minecraft:cake` |
| `phos_danny` | Danny | Phos | `minecraft:string` |
| `sama_mika` | Mika | Sama | `minecraft:lilac` |
| `sophia_luna` | Luna | Sophia | `minecraft:blue_orchid` |
| `umiempi_patitas` | Patitas | Umiempi | `minecraft:gray_dye` |
| `vaynilo_felipe` | Felipe | Vaynilo | `minecraft:light_gray_dye` |
| `vorti_hds` | HDS | Vorti | `minecraft:poppy` |
| `whiswiim_dunya` | Dünya | Whiswiim | `minecraft:sweet_berries` |
| `willy_lancer` | Lancer | Willy | `minecraft:paper` |
| `xp_baku` | Baku | XP | `minecraft:salmon` |
| `zer_bullet` | Bullet | Zer | `minecraft:red_carpet` |

Todas las recetas son de tipo `minecraft:crafting_shapeless`, grupo `totems`, categoría `misc`.  
El ingrediente base siempre es `minecraft:totem_of_undying`.

---

## 6. Referencia de scoreboards

### Namespace `tr`

| Objetivo | Criterio | Uso |
|----------|----------|-----|
| `prank-level` | dummy | Nivel de pranks guardado (0–5) |
| `recording-status` | dummy | Estado de grabación (0/1) |
| `streaming-status` | dummy | Estado de streaming (0/1) |
| `afk-status` | dummy | Estado AFK (0/1) |
| `color-step` | dummy | Paso del selector de color (0–7) |
| `color-d1`…`color-d6` | dummy | Dígitos hex del color (0–15) |
| `leave` | `minecraft.custom:minecraft.leave_game` | Detección de reconexión |
| `health` | `health` | Vida en TAB (setdisplay list) |
| `prank` | trigger | Input del jugador: nivel de prank |
| `streaming` | trigger | Input del jugador: toggle streaming |
| `recording` | trigger | Input del jugador: toggle recording |
| `afk` | trigger | Input del jugador: toggle AFK |
| `help` | trigger | Input del jugador: mostrar ayuda |
| `rules` | trigger | Input del jugador: mostrar reglas |
| `version` | trigger | Input del jugador: mostrar versión |
| `color` | trigger | Input del jugador: iniciar selector |
| `colorpick` | trigger | Input del jugador: elegir dígito hex |

### Namespace `qol`

| Objetivo | Criterio | Uso |
|----------|----------|-----|
| `sleep_calc` | dummy | Variables de cálculo del sueño (fake players) |

Variables en `sleep_calc` (fake players):

| Fake player | Valor | Descripción |
|-------------|-------|-------------|
| `var_by_four` | 4 | Constante divisora |
| `var_percent_base` | 100 | Base porcentual |
| `var_mod_two` | 2 | Constante módulo 2 |
| `var_bump_min` | 10 | Mínimo para bump de calibración |
| `var_overworld_total` | dinámico | Total de jugadores no-espectador en Overworld |
| `var_overworld_active` | dinámico | Jugadores activos (excluye AFK_OVERWORLD) |
| `var_sleepers_needed` | dinámico | Durmientes mínimos necesarios |
| `var_sleep_percent` | dinámico | Porcentaje final a aplicar |
| `var_sleepers_scaled` | dinámico | Producto intermedio: `sleepers_needed × 100` |
| `var_div_remainder` | dinámico | Sin uso activo (reservado) |
| `var_active_mod_four` | dinámico | `active % 4` para bump correction |

### Namespace `totems`

| Objetivo | Criterio | Uso |
|----------|----------|-----|
| `used_totem` | `minecraft.used:minecraft.totem_of_undying` | Detección de activación del tótem |
| `used_jann`…`used_bullet` (×30) | dummy | Contador de 3 ticks por tótem |

---

## 7. Referencia de teams

### Teams AFK

| Nombre | Color | Sufijo visible |
|--------|-------|----------------|
| `AFK_OVERWORLD` | gray | `⌀ ☀` |
| `AFK_NETHER` | gray | `⌀ 🔥` |
| `AFK_END` | gray | `⌀ ✦` |

### Teams de estado (24 teams)

Patrón: `t_p{0-5}_r{0,1}_s{0,1}`

| Prank | Color símbolo | Icono |
|-------|--------------|-------|
| 0 | gray | ⓪ |
| 1 | green | ① |
| 2 | yellow | ② |
| 3 | gold | ③ |
| 4 | red | ④ |
| 5 | dark_red | ⑤ |

El indicador de recording es `●` rojo oscuro; el de streaming es `●` morado oscuro.

---

## 8. Referencia de archivos

```
data/
├── minecraft/tags/function/
│   ├── load.json
│   └── tick.json
│
├── tr/function/
│   ├── minecraft/
│   │   ├── load.mcfunction            # Entrada de carga: animación + setup
│   │   ├── tick.mcfunction            # Entrada de tick: lógica principal
│   │   └── loading/1-10.mcfunction    # Animación de carga (pasos)
│   │   └── loading/message.mcfunction # Mensaje final de carga
│   ├── admin/
│   │   ├── create_scoreboards.mcfunction
│   │   ├── clear_scoreboards.mcfunction
│   │   ├── create_teams.mcfunction
│   │   ├── clear_teams.mcfunction
│   │   ├── update_teams.mcfunction
│   │   └── challenges/
│   │       ├── new.mcfunction
│   │       ├── loading/1-9.mcfunction
│   │       └── loading/message.mcfunction
│   ├── control/
│   │   ├── triggers.mcfunction
│   │   ├── join_message.mcfunction
│   │   └── color/
│   │       ├── start.mcfunction
│   │       ├── menu.mcfunction
│   │       ├── pick.mcfunction
│   │       ├── store_hex_digit.mcfunction
│   │       ├── confirm.mcfunction
│   │       ├── confirm_macro.mcfunction
│   │       ├── apply.mcfunction
│   │       ├── apply_macro.mcfunction
│   │       └── preview_macro.mcfunction
│   └── fallback/
│       ├── prank/0-5.mcfunction
│       ├── streaming/on.mcfunction
│       ├── streaming/off.mcfunction
│       ├── recording/on.mcfunction
│       └── recording/off.mcfunction
│
├── qol/function/
│   ├── minecraft/
│   │   ├── load.mcfunction            # Delegación a módulos QoL
│   │   └── tick.mcfunction            # Delegación a módulos QoL
│   ├── sleep/
│   │   ├── admin/
│   │   │   ├── load.mcfunction        # Crea scoreboards de cálculo
│   │   │   └── tick.mcfunction        # Llama a calculate cada tick
│   │   ├── calculate.mcfunction       # Lógica completa del cálculo
│   │   └── apply_macro.mcfunction     # Aplica gamerule con macro
│   └── vehicle_speeds/
│       ├── admin/tick.mcfunction      # Dispatcher de vehículos
│       ├── pig.mcfunction
│       ├── strider.mcfunction
│       └── happyghast.mcfunction
│
├── qol/recipe/vehicle_speeds/
│   └── everything_on_a_stick.json
│
├── totems/function/
│   ├── minecraft/
│   │   ├── load.mcfunction            # Scoreboards + recetas
│   │   └── tick.mcfunction            # Llama a use_totem
│   ├── use_totem.mcfunction           # Detección y mensajes (30 tótems)
│   ├── give_recipes.mcfunction        # Desbloquea todas las recetas
│   └── admin/
│       ├── create_scoreboards.mcfunction
│       └── clear_scoreboards.mcfunction
│
└── totems/recipe/
    └── *.json                         # 30 recetas shapeless de tótem
```
