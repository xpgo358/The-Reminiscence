# TR - AFK

## Objetivo
Permitir que cada jugador marque/desmarque estado AFK y reflejarlo inmediatamente en:
- Mensajeria global.
- Team asignado por dimension.
- Sufijo y hover descriptivo del jugador.

## Entrada de usuario
Trigger utilizado:
- /trigger afk

Logica principal:
- [Datapack/data/tr/function/control/triggers.mcfunction](../../../Datapack/data/tr/function/control/triggers.mcfunction)

## Flujo tecnico
1. Si afk trigger se activa y afk-status=0, se marca tag temporal tr_afk_on.
2. Si afk trigger se activa y afk-status=1, se marca tag temporal tr_afk_off.
3. Se actualiza afk-status (1 o 0).
4. Se recalculan teams.
5. Se anuncia mensaje global de entrada/salida AFK.
6. Se limpian tags temporales.

## Teams AFK por dimension
Definicion en:
- [Datapack/data/tr/function/admin/create_teams.mcfunction](../../../Datapack/data/tr/function/admin/create_teams.mcfunction)

Asignacion en:
- [Datapack/data/tr/function/admin/update_teams.mcfunction](../../../Datapack/data/tr/function/admin/update_teams.mcfunction)

Regla:
- Jugador con afk-status=1 entra a:
  - AFK_OVERWORLD si esta en overworld
  - AFK_NETHER si esta en nether
  - AFK_END si esta en end

## Integracion cross-modulo
QoL (sueno dinamico) usa team AFK_OVERWORLD para excluir AFK del conteo de activos:
- [Datapack/data/qol/function/sleep/calculate.mcfunction](../../../Datapack/data/qol/function/sleep/calculate.mcfunction)

## Operacion
Ver tambien:
- [Administracion y Operacion](admin-operations.md)
- [Resumen tecnico y modelo de datos](overview.md)
