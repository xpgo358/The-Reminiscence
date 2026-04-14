# TR - Resumen Tecnico y Modelo de Datos

## Objetivo funcional
TR mantiene un estado social consistente para todos los jugadores, combinando:
- Triggers de auto-gestion.
- Scoreboards de estado.
- Asignacion de teams para prefijos/sufijos y hover text.

## Pipeline de ejecucion
### Carga
Archivo principal: [Datapack/data/tr/function/minecraft/load.mcfunction](../../../Datapack/data/tr/function/minecraft/load.mcfunction)

Acciones:
1. Lanza secuencia de carga visual en 10 pasos.
2. Recrea scoreboards de TR.
3. Recrea teams de TR.

Secuencia visual:
- Inicio: [Datapack/data/tr/function/minecraft/loading/1.mcfunction](../../../Datapack/data/tr/function/minecraft/loading/1.mcfunction)
- Final: [Datapack/data/tr/function/minecraft/loading/10.mcfunction](../../../Datapack/data/tr/function/minecraft/loading/10.mcfunction)
- Mensaje final: [Datapack/data/tr/function/minecraft/loading/message.mcfunction](../../../Datapack/data/tr/function/minecraft/loading/message.mcfunction)

### Tick
Archivo principal: [Datapack/data/tr/function/minecraft/tick.mcfunction](../../../Datapack/data/tr/function/minecraft/tick.mcfunction)

Acciones por tick:
1. Inicializa jugadores nuevos (tag update1 + valores base).
2. Reasigna teams para mantener estado visual sincronizado.
3. Ejecuta triggers y comandos de jugador.
4. Lanza mensaje de retorno al detectar leave=1.

## Modelo de estado
### Scoreboards de estado
Definicion en [Datapack/data/tr/function/admin/create_scoreboards.mcfunction](../../../Datapack/data/tr/function/admin/create_scoreboards.mcfunction):
- prank-level
- recording-status
- streaming-status
- afk-status
- color-step
- color-d1..color-d6
- leave
- health

### Triggers habilitados
- prank
- streaming
- recording
- help
- rules
- version
- afk
- color
- colorpick

## Modelo visual con teams
Creacion en [Datapack/data/tr/function/admin/create_teams.mcfunction](../../../Datapack/data/tr/function/admin/create_teams.mcfunction).

Estructura:
- AFK por dimension: AFK_OVERWORLD, AFK_NETHER, AFK_END.
- Estados combinados no-AFK: 24 teams por combinacion:
  - prank-level en 0..5
  - recording-status en 0..1
  - streaming-status en 0..1

Actualizacion en vivo:
- [Datapack/data/tr/function/admin/update_teams.mcfunction](../../../Datapack/data/tr/function/admin/update_teams.mcfunction)

## Relacion con otros modulos
- QoL depende de AFK_OVERWORLD para excluir AFK del calculo de sleepers activos.
- Totems no comparte estado, pero se integra con help y experiencia de jugador.
