# TR: ciclo de carga y limpieza

Este documento describe el ciclo de vida completo del namespace `tr`, desde el arranque hasta la limpieza de recursos.

## Puntos de entrada

- `tr:minecraft/load`
- `tr:minecraft/tick`
- `tr:admin/clear_scoreboards`
- `tr:admin/clear_teams`
- `tr:admin/create_scoreboards`
- `tr:admin/create_teams`
- `tr:admin/update_teams`

## Carga

En `tr:minecraft/load` se programa la secuencia de carga visual y se llama a cuatro bloques de administración:

1. `tr:admin/clear_scoreboards`
2. `tr:admin/create_scoreboards`
3. `tr:admin/clear_teams`
4. `tr:admin/create_teams`

Ese orden es importante: primero se elimina cualquier residuo previo y después se reconstruye el estado esperado desde cero.

## Tick

En cada tick, `tr:minecraft/tick` sigue este orden:

1. Inicializa jugadores nuevos.
2. Reasigna equipos.
3. Procesa triggers y mensajes.
4. Muestra el mensaje de reentrada si corresponde.

La separación entre inicialización, equipos y triggers evita que un jugador nuevo quede en un estado intermedio.

## Limpieza

La limpieza elimina scoreboards, objetivos de trigger y membresías de equipo. Esto permite recargar el datapack sin arrastrar estados viejos.

## Por qué importa

El namespace `tr` no depende solo de la lógica de juego: también define la coherencia interna del servidor. Si esta base no estuviera bien aislada, cualquier recarga manual podría dejar equipos rotos, triggers deshabilitados o estados de jugador desincronizados.