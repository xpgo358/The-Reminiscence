# The Reminiscence Datapack - Documentacion General

## Estado de esta iteracion
- Cambios validados desde minidocs: actualizacion de referencias de version del proyecto/datapack a 2.0.0.
- Cambios validados desde minidocs: receta de Crisho actualizada con nombre visible Golden Dandelion, conservando item_model crisho_totem.
- Reporte de validacion final: unresolved issues = 0.

## Objetivo del datapack
The Reminiscence es un datapack modular para Java Edition que centraliza tres bloques funcionales:
- TR: sistema social y de estado de jugadores (AFK, prank level, streaming, recording), mensajes y color del locator bar.
- Totems: totems cosmeticos personalizados con recetas y mensajes contextuales al activarse.
- QoL: mejoras de calidad de vida (sueno dinamico por porcentaje y boost de velocidad para monturas con un item unificado).

## Compatibilidad de pack
Segun [Datapack/pack.mcmeta](../Datapack/pack.mcmeta):
- Descripcion del pack: The Reminiscence Data Pack - 2.0.0
- Rango de formato: min_format 101, max_format 101

Referencia externa verificada:
- Minecraft Wiki (Pack format): uso de min_format y max_format en versiones modernas.
- Minecraft Wiki (Game rule): semantica de players_sleeping_percentage para 0, 1..100 y >100.

## Arquitectura de carga y tick
Entradas vanilla del datapack:
- Load tag: [Datapack/data/minecraft/tags/function/load.json](../Datapack/data/minecraft/tags/function/load.json)
- Tick tag: [Datapack/data/minecraft/tags/function/tick.json](../Datapack/data/minecraft/tags/function/tick.json)

Orden de carga:
1. tr:minecraft/load
2. totems:minecraft/load
3. qol:minecraft/load

Orden de tick:
1. tr:minecraft/tick
2. totems:minecraft/tick
3. qol:minecraft/tick

## Modulos
- [Arquitectura detallada](architecture.md)
- [Modulo TR (entrada rapida)](modules/tr.md)
- [Modulo TR (documentacion extendida por secciones)](modules/tr/README.md)
- [Modulo Totems](modules/totems.md)
- [Modulo QoL (entrada rapida)](modules/qol.md)
- [Modulo QoL (documentacion extendida por secciones)](modules/qol/README.md)

## Convenciones observadas
- Inicializacion en funciones admin/load por modulo.
- Logica recurrente en admin/tick o control/tick por modulo.
- Uso intensivo de scoreboards para estado temporal y persistente de jugador.
- Uso de equipos (teams) para prefijos/sufijos y visualizacion contextual.
- Uso de macros de funcion (sintaxis con $) para construir comandos dinamicos.
