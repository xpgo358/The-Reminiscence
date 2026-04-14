# QoL - Operacion y Administracion

## Funciones operativas
### Inicializacion de submodulo sleep
- [Datapack/data/qol/function/sleep/admin/load.mcfunction](../../../Datapack/data/qol/function/sleep/admin/load.mcfunction)

Uso:
- Reejecutar si se resetea objective sleep_calc o tras mantenimiento de scoreboards.

### Recalculo de sueno
- [Datapack/data/qol/function/sleep/admin/tick.mcfunction](../../../Datapack/data/qol/function/sleep/admin/tick.mcfunction)

Uso:
- Ejecutar manualmente para aplicar ajuste inmediato de players_sleeping_percentage.

### Reaplicacion de bonuses de velocidad
- [Datapack/data/qol/function/vehicle_speeds/admin/tick.mcfunction](../../../Datapack/data/qol/function/vehicle_speeds/admin/tick.mcfunction)

Uso:
- Forzar actualizacion inmediata de bonuses en monturas.

## Procedimientos sugeridos
### Recuperacion de QoL tras reset parcial
1. Ejecutar qol:sleep/admin/load
2. Ejecutar qol:sleep/admin/tick
3. Ejecutar qol:vehicle_speeds/admin/tick

### Verificacion funcional rapida
1. Comprobar que existe objective sleep_calc.
2. Comprobar que se otorga receta qol:vehicle_speeds/everything_on_a_stick.
3. Comprobar que pig/strider/happy_ghast reciben bonus al sostener el item.

## Dependencia operativa importante
Sleep dinamico depende de TR para AFK_OVERWORLD. Si TR no esta operativo o sus teams estan desincronizados, el porcentaje de durmientes puede no reflejar jugadores realmente activos.
