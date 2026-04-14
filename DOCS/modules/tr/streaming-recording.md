# TR - Streaming y Recording

## Objetivo
Permitir a cada jugador declarar su estado de emision y grabacion, mostrando esa informacion en:
- Mensajes globales de activacion/desactivacion.
- Sufijos de team con iconos.
- Hover descriptivo de contexto para otros jugadores.

## Entradas de usuario
Triggers:
- /trigger streaming
- /trigger recording

Ambos funcionan como toggle (interruptor).

## Flujo tecnico
Logica en:
- [Datapack/data/tr/function/control/triggers.mcfunction](../../../Datapack/data/tr/function/control/triggers.mcfunction)

Para cada estado (streaming y recording):
1. Se detecta transicion con tags temporales (_on / _off).
2. Se actualiza scoreboard de estado a 1 o 0.
3. Se recalculan teams para reflejar prefijos/sufijos.
4. Se emite mensaje global anunciando el cambio.
5. Se limpian tags temporales.

## Scoreboards implicados
- streaming-status
- recording-status

## Integracion con teams
Definicion visual:
- [Datapack/data/tr/function/admin/create_teams.mcfunction](../../../Datapack/data/tr/function/admin/create_teams.mcfunction)

Aplicacion por tick:
- [Datapack/data/tr/function/admin/update_teams.mcfunction](../../../Datapack/data/tr/function/admin/update_teams.mcfunction)

Indicadores visuales:
- Punto rojo para recording.
- Punto dark_purple para streaming.
- Hover explicativo en ambos indicadores.

## Consideraciones de uso
- El estado se persiste en scoreboards de jugador.
- El refresco por tick garantiza que el tab y los sufijos no queden obsoletos.
- Se combina con prank-level en una sola representacion de estado social.
