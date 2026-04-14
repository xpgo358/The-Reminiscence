# QoL - Resumen Tecnico

## Objetivo funcional
QoL modifica reglas de confort sin alterar progresion base:
- Gestion de noche mas adaptativa al numero de jugadores activos.
- Mejora de movilidad para pig, strider y happy ghast con un unico item.

## Pipeline del modulo
### Load
- [Datapack/data/qol/function/minecraft/load.mcfunction](../../../Datapack/data/qol/function/minecraft/load.mcfunction)

Ejecuta inicializacion de constantes para calculo de sueno.

### Tick
- [Datapack/data/qol/function/minecraft/tick.mcfunction](../../../Datapack/data/qol/function/minecraft/tick.mcfunction)

Orden por tick:
1. Ajuste de velocidad para happy ghast.
2. Ajuste de velocidad para pig.
3. Ajuste de velocidad para strider.
4. Entrega de receta del item Everything on a Stick.
5. Recalculo de players_sleeping_percentage.

## Dependencias
- Depende de team AFK_OVERWORLD (TR) para excluir AFK del conteo activo de sleepers.
- Usa macros para aplicar gamerule con valor calculado dinamicamente.
