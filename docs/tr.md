# Namespace `tr`

`tr` es el núcleo del datapack. Aquí viven la inicialización, la sincronización de estado por jugador, los equipos visuales, los triggers de interacción y varias utilidades de administración.

## Qué cubre esta parte

- [Ciclo de carga y limpieza](tr/lifecycle.md)
- [Scoreboards y estado de jugador](tr/scoreboards.md)
- [Equipos y presencia](tr/equipos.md)
- [Triggers y mensajes](tr/triggers.md)
- [Selector de color HEX](tr/color.md)
- [Challenges](tr/challenges.md)
- [Funciones fallback](tr/fallback.md)

## Siguiente lectura

- [Tótems personalizados](totems.md)
- [Sistema de dormir](qol/dormir.md)
- [Velocidades de vehículos](qol/vehiculos.md)

## Cómo se ejecuta

`tr:minecraft/load` prepara la base del sistema: scoreboards, equipos y animación de carga. `tr:minecraft/tick` mantiene el estado vivo, actualiza equipos, procesa triggers y emite mensajes de contexto.

## Idea central

El namespace está diseñado para que el estado visible del jugador sea siempre una consecuencia directa de sus scoreboards. Eso permite que el sistema sea predecible, fácil de depurar y estable incluso con muchos jugadores activos.