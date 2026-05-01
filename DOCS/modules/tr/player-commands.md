# TR - Comandos de Jugador y Mensajeria

## Objetivo
Concentrar comandos de utilidad para jugadores y mensajes de contexto del servidor.

## Comandos trigger de informacion
Implementados en:
- [Datapack/data/tr/function/control/triggers.mcfunction](../../../Datapack/data/tr/function/control/triggers.mcfunction)

### /trigger help
Muestra:
- Resumen de triggers disponibles.
- Instrucciones de uso para prank, afk, streaming, recording y color.
- Recordatorio sobre reglas y totems.

### /trigger rules
Muestra:
- Bloque completo de normas de convivencia del servidor.

### /trigger version
Muestra version del datapack:
- v2.0.1

Condicion especial de habilitacion observada:
- version se habilita cuando el jugador tiene la combinacion
  afk-status=1, prank-level=3, streaming-status=1 y recording-status=1.

## Rehabilitacion de triggers por tick
En cada tick, el sistema:
- resetea/setea valores base de triggers,
- vuelve a habilitarlos con scoreboard players enable,
- restringe los que requieren condicion (version y colorpick).

Referencia:
- [Datapack/data/tr/function/control/triggers.mcfunction](../../../Datapack/data/tr/function/control/triggers.mcfunction)

## Mensajeria de retorno
Al detectar leave=1, se ejecuta:
- [Datapack/data/tr/function/control/join_message.mcfunction](../../../Datapack/data/tr/function/control/join_message.mcfunction)

Comportamiento:
1. Envia mensaje de bienvenida y recordatorio de /trigger help.
2. Reinicia leave a 0.
3. Reproduce sonido de campana al jugador.

## Mensajeria de carga
Carga general del datapack TR:
- [Datapack/data/tr/function/minecraft/loading/message.mcfunction](../../../Datapack/data/tr/function/minecraft/loading/message.mcfunction)

Anuncio de challenge:
- [Datapack/data/tr/function/admin/challenges/loading/message.mcfunction](../../../Datapack/data/tr/function/admin/challenges/loading/message.mcfunction)
