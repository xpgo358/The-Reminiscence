# TR: triggers y mensajes

Los triggers son la interfaz pública del namespace `tr`. Son el modo normal de cambiar estados y pedir información al servidor.

## Triggers disponibles

| Trigger | Comportamiento |
|---|---|
| `afk` | Alterna el estado AFK |
| `prank` | Ajusta el nivel de prank |
| `streaming` | Alterna streaming |
| `recording` | Alterna grabación |
| `help` | Muestra ayuda ampliada |
| `rules` | Muestra las reglas del servidor |
| `color` | Inicia el selector de color HEX |
| `colorpick` | Proporciona el valor del dígito actual |

## Patrón de uso

Los triggers están pensados para una experiencia corta y directa:

- El jugador escribe un comando simple.
- El sistema interpreta el valor del trigger en el siguiente tick.
- El score se resetea a `-1` y se vuelve a habilitar automáticamente.

## Mensajes por estado

El namespace emite mensajes cuando cambian estos estados:

- AFK activado o desactivado.
- Streaming activado o desactivado.
- Recording activado o desactivado.
- Entrada al servidor después de haber salido.

Los mensajes son cortos y claros para no ensuciar el chat, pero suficientemente explícitos para que el resto del servidor entienda el cambio.

## Ayuda y reglas

`help` y `rules` devuelven textos largos en chat con formato resaltado. La intención es que el jugador tenga una ayuda integrada sin salir del juego ni consultar documentación externa.

## Flujo interno

1. Se lee el scoreboard del trigger.
2. Se actualiza el scoreboard de estado asociado.
3. Se sincronizan equipos si el cambio afecta a presencia visual.
4. Se emite el mensaje contextual.
5. Se limpia la marca temporal del trigger.

## Recomendación de diseño

Los triggers no deberían usarse como almacenamiento de estado duradero. Solo son la puerta de entrada al sistema; la persistencia real vive en los scoreboards de estado.