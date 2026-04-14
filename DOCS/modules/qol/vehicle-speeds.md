# QoL - Velocidades de Monturas

## Objetivo
Acelerar monturas especificas cuando el jugador montado sostiene un item custom:
- pig
- strider
- happy ghast

## Orquestacion
Tick del submodulo:
- [Datapack/data/qol/function/vehicle_speeds/admin/tick.mcfunction](../../../Datapack/data/qol/function/vehicle_speeds/admin/tick.mcfunction)

Secuencia:
1. Ejecuta handler de happy ghast.
2. Ejecuta handler de pig.
3. Ejecuta handler de strider.
4. Da receta del item a todos los jugadores.

## Item habilitador
Receta:
- [Datapack/data/qol/recipe/vehicle_speeds/everything_on_a_stick.json](../../../Datapack/data/qol/recipe/vehicle_speeds/everything_on_a_stick.json)

Datos del item:
- Base: minecraft:clock
- item_model: everything_on_a_stick
- item_name: Everything on a Stick
- Lore EN/ES explicando uso

## Logica por entidad
### Pig
- [Datapack/data/qol/function/vehicle_speeds/pig.mcfunction](../../../Datapack/data/qol/function/vehicle_speeds/pig.mcfunction)
- Remueve modifier previo qol:everything_on_a_stick_boost.
- Si jugador monta pig y sostiene el item, aplica movement_speed +0.1 (add_value).

### Strider
- [Datapack/data/qol/function/vehicle_speeds/strider.mcfunction](../../../Datapack/data/qol/function/vehicle_speeds/strider.mcfunction)
- Remueve modifier previo.
- Si jugador monta strider y sostiene el item, aplica movement_speed +0.1 (add_value).

### Happy Ghast
- [Datapack/data/qol/function/vehicle_speeds/happyghast.mcfunction](../../../Datapack/data/qol/function/vehicle_speeds/happyghast.mcfunction)
- Remueve modifier previo.
- Si jugador monta happy_ghast y sostiene el item, aplica flying_speed +0.025 (add_value).

## Motivo del patron remove/add por tick
El sistema garantiza determinismo:
- evita acumulaciones de modificadores,
- asegura que el bonus solo exista mientras se cumple condicion de montura + item.
