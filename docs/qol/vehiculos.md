# Velocidades de vehículos

Este módulo aplica un impulso temporal a ciertos vehículos cuando el jugador lleva el objeto correcto en la mano. El comportamiento está pensado para que se sienta natural: el boost aparece al montar con el objeto adecuado y desaparece en cuanto se deja de cumplir la condición.

## Puntos de entrada

- `qol:vehicle_speeds/admin/tick`
- `qol:vehicle_speeds/happyghast`
- `qol:vehicle_speeds/pig`
- `qol:vehicle_speeds/strider`

## Relacionado

- [Introducción a QOL](../qol.md)
- [Sistema TR](../tr.md)
- [Tótems personalizados](../totems.md)

## Cómo funciona

Cada tick se elimina el modificador de velocidad y se vuelve a añadir solo si un jugador montado cumple la condición del ítem en mano. Ese patrón evita acumulaciones y elimina el boost inmediatamente al dejar de cumplir la condición.

La secuencia es deliberadamente redundante:

1. Retira el modificador actual.
2. Comprueba si hay un jinete elegible.
3. Verifica el objeto en mano.
4. Reaplica el modificador solo donde corresponde.

Eso simplifica el mantenimiento y evita tener que rastrear estados intermedios.

## Vehículos soportados

| Entidad | Atributo | Valor |
|---|---|---|
| `minecraft:pig` | `minecraft:movement_speed` | `0.1` |
| `minecraft:strider` | `minecraft:movement_speed` | `0.1` |
| `minecraft:happy_ghast` | `minecraft:flying_speed` | `0.025` |

### Pig

El cerdo gana velocidad de movimiento mientras el jinete tenga el objeto habilitador.

### Strider

El strider recibe el mismo patrón de velocidad que el cerdo. El objetivo es mantener una experiencia de desplazamiento similar para ambos montables.

### Happy Ghast

El happy ghast usa `flying_speed` en vez de `movement_speed`, porque su desplazamiento no se comporta como el de una criatura terrestre.

## Objeto habilitador

La receta crea el objeto `minecraft:clock` con `item_model` `everything_on_a_stick`.

Ingredientes:

- `minecraft:warped_fungus`
- `minecraft:snowball`
- `minecraft:carrot`
- `minecraft:fishing_rod`

La receta se desbloquea para todos los jugadores desde `qol:minecraft/load`.

## Por qué se elimina y se reaplica cada tick

Un modificador de atributo persistente sería más difícil de sincronizar. Al regenerarlo cada tick, el sistema queda alineado con el estado real del jugador y del vehículo sin necesidad de almacenamiento adicional.

## Resultado práctico

El jugador siente que el vehículo responde al objeto en su mano. Si suelta el objeto, desmonta o cambia de criatura, el efecto desaparece enseguida.