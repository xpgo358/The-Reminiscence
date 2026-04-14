# TR - Prank

## Objetivo
Exponer el nivel de tolerancia a pranks de cada jugador como parte visible de su estado social.

## Entrada de usuario
Trigger utilizado:
- /trigger prank set <nivel>

Rango esperado por logica:
- 0..5

Procesamiento:
- [Datapack/data/tr/function/control/triggers.mcfunction](../../../Datapack/data/tr/function/control/triggers.mcfunction)

## Flujo tecnico
1. El trigger prank recibe el valor del jugador.
2. Si el valor esta en 0..5, se copia a prank-level.
3. En cada tick, update_teams asigna el team combinando prank-level + recording-status + streaming-status.
4. El team define el sufijo numerico y el hover explicativo del nivel.

## Matriz de estado
Para prank existen 6 niveles (0..5), cada uno combinado con:
- recording-status: 0/1
- streaming-status: 0/1

Total de combinaciones prank no-AFK:
- 6 x 2 x 2 = 24 teams

## Representacion visual
Definida en:
- [Datapack/data/tr/function/admin/create_teams.mcfunction](../../../Datapack/data/tr/function/admin/create_teams.mcfunction)

Incluye:
- Sufijo con simbolo de nivel (⓪..⑤).
- Hover por nivel explicando limites y permisividad del prank.
- Indicadores adicionales si recording/streaming estan activos.

## Operacion y consistencia
Reasignacion por tick:
- [Datapack/data/tr/function/admin/update_teams.mcfunction](../../../Datapack/data/tr/function/admin/update_teams.mcfunction)

Este enfoque evita desincronizacion visual si cambian varios estados en el mismo intervalo.
