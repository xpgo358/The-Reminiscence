# Modulo Totems

## Contexto y objetivo
El namespace totems implementa personalizacion cosmetica de totems con dos piezas:
- Recetas custom para crear variantes de totem.
- Mensajes contextuales cuando se consume un totem concreto.

No altera la mecanica base de resurreccion de Minecraft; la capa funcional principal es narrativa y de identidad por jugador.

## Puntos de entrada
- Load: [Datapack/data/totems/function/minecraft/load.mcfunction](../../Datapack/data/totems/function/minecraft/load.mcfunction)
- Tick: [Datapack/data/totems/function/minecraft/tick.mcfunction](../../Datapack/data/totems/function/minecraft/tick.mcfunction)

## Inicializacion (load)
Archivo: [Datapack/data/totems/function/minecraft/load.mcfunction](../../Datapack/data/totems/function/minecraft/load.mcfunction)

Accion:
- Crea todos los scoreboards de control de uso de totem.

Definicion: [Datapack/data/totems/function/admin/create_scoreboards.mcfunction](../../Datapack/data/totems/function/admin/create_scoreboards.mcfunction)

## Loop por tick
Orquestador: [Datapack/data/totems/function/minecraft/tick.mcfunction](../../Datapack/data/totems/function/minecraft/tick.mcfunction)

Acciones por tick:
1. Ejecuta detector y emisor de mensajes por tipo de totem.
2. Entrega recetas custom a todos los jugadores.

Archivos:
- Deteccion y mensajes: [Datapack/data/totems/function/use_totem.mcfunction](../../Datapack/data/totems/function/use_totem.mcfunction)
- Entrega de recetas: [Datapack/data/totems/function/give_recipes.mcfunction](../../Datapack/data/totems/function/give_recipes.mcfunction)

## Modelo de deteccion
### Scoreboards
- used_totem: contador vanilla minecraft.used:minecraft.totem_of_undying
- used_xxx: scoreboards dummy por variante (ejemplo: used_jann, used_baku, used_bullet)

### Patrón por variante
Cada variante sigue el mismo patron en [Datapack/data/totems/function/use_totem.mcfunction](../../Datapack/data/totems/function/use_totem.mcfunction):
1. Detectar item_model en mano principal y secundaria.
2. Marcar scoreboard used_xxx con valor temporal (3 ticks).
3. Decrementar contador temporal cada tick.
4. Si used_totem indica activacion y used_xxx sigue activo, emitir tellraw global tematico.

### Reset de evento
Al final del loop:
- used_totem se resetea para evitar mensajes duplicados por el mismo uso.

## Recetas de totems
Carpeta:
- [Datapack/data/totems/recipe](../../Datapack/data/totems/recipe)

Entrega de recetas en bloque:
- [Datapack/data/totems/function/give_recipes.mcfunction](../../Datapack/data/totems/function/give_recipes.mcfunction)

Nomenclatura observada:
- Un archivo de receta por variante de totem, alineado con item_model y mensajes.

## Mantenimiento
- Limpiar scoreboards de totems:
  - [Datapack/data/totems/function/admin/clear_scoreboards.mcfunction](../../Datapack/data/totems/function/admin/clear_scoreboards.mcfunction)

## Enfoque de implementacion
- Se usa ventana temporal corta (3 ticks) para robustez de deteccion entre mano y evento de uso.
- La resolucion por item_model evita colisiones entre variantes del mismo item base.
- El modulo privilegia feedback social (chat global) sobre cambios de gameplay.
