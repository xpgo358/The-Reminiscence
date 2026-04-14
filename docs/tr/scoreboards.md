# TR: scoreboards y estado de jugador

Los scoreboards de `tr` almacenan el estado persistente y transitorio que alimenta el resto del sistema.

## Objetivos principales

| Objetivo | Tipo | Función |
|---|---|---|
| `prank-level` | dummy | Nivel de prank actual del jugador |
| `recording-status` | dummy | 0 o 1 según si está grabando |
| `streaming-status` | dummy | 0 o 1 según si está en directo |
| `afk-status` | dummy | 0 o 1 según si está AFK |
| `color-step` | dummy | Etapa actual del selector de color |
| `color-d1` a `color-d6` | dummy | Dígitos hex del color en construcción |
| `leave` | `minecraft.custom:minecraft.leave_game` | Detecta reentrada tras salir |
| `health` | health | Vida mostrada en el TAB |

## Scoreboards de estado

Los cuatro scoreboards de estado de jugador (`prank-level`, `recording-status`, `streaming-status`, `afk-status`) son la fuente de verdad para el resto del namespace.

- `prank-level` controla el equipo visual y el nivel de prank declarado por el jugador.
- `recording-status` y `streaming-status` alimentan los equipos combinados y los mensajes de presencia.
- `afk-status` decide tanto el equipo AFK como la exclusión del sistema de dormir.

## Scoreboards del selector de color

El selector de color usa `color-step` para saber en qué paso se encuentra el usuario y `color-d1` a `color-d6` para almacenar cada dígito del color final.

El flujo es deliberadamente incremental:

1. Se reinicia todo a valores seguros.
2. Se elige un dígito.
3. Se copia al scoreboard del paso actual.
4. Se repite hasta completar los seis caracteres.

## Scoreboards de sistema

`leave` se usa como puente entre la acción vanilla de salir del juego y el mensaje de bienvenida al volver. `health` se añade como marcador visible en la lista de jugadores.

## Reglas de diseño

- Todo estado que afecta a otros sistemas vive en scoreboards, no en texto o memoria temporal.
- Los scoreboards de estado se resetean y reactivan cada tick para evitar bloqueos.
- El sistema prefiere valores enteros simples para que la lógica sea fácil de inspeccionar desde consola.