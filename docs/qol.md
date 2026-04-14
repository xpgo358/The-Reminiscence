# Introducción a QOL

QOL es el conjunto de sistemas de calidad de vida del datapack. Su objetivo es suavizar la experiencia del servidor sin alterar su identidad: hacer que dormir sea más flexible, que ciertos vehículos respondan al ítem correcto y que el comportamiento general del mundo sea menos rígido para los jugadores activos.

## Qué incluye

- [Sistema de dormir](qol/dormir.md)
- [Velocidades de vehículos](qol/vehiculos.md)

## Qué papel cumple

QOL actúa como la capa práctica que acompaña a la lógica principal del servidor. Mientras `tr` organiza estados, presencia y mensajes, QOL se encarga de dos problemas muy concretos de experiencia de juego:

- Ajustar el descanso nocturno al número real de jugadores activos.
- Añadir una respuesta clara y estable a ciertos vehículos al llevar el objeto habilitador.

## Cómo leer esta parte

Si quieres entender QOL de forma ordenada, este es el recorrido recomendado:

1. Leer esta introducción para entender la intención general.
2. Pasar al sistema de dormir, porque es el bloque más importante y el que más depende de `tr`.
3. Terminar con velocidades de vehículos, que es un sistema más pequeño pero igualmente autónomo.

## Relación con otros módulos

- Depende de `tr` para conocer quién está AFK.
- No modifica la lógica de tótems, pero convive con ellos en la misma rotación de carga y tick.
- Comparte filosofía con el resto del datapack: estado explícito, poco ruido y comportamiento estable.

## Resumen rápido

- `dormir`: calcula el porcentaje del gamerule `players_sleeping_percentage`.
- `vehiculos`: aplica boosts a monturas concretas cuando el jugador lleva el objeto adecuado.

## Punto de entrada del namespace

- `qol:minecraft/load`
- `qol:minecraft/tick`

Esos puntos de entrada solo coordinan los sistemas internos; la lógica importante vive en los submódulos detallados.