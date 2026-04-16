# Arquitectura de Ejecucion

## 1) Entradas globales
El datapack se integra en los tags globales de funciones de Minecraft:
- Carga: [Datapack/data/minecraft/tags/function/load.json](../Datapack/data/minecraft/tags/function/load.json)
- Tick: [Datapack/data/minecraft/tags/function/tick.json](../Datapack/data/minecraft/tags/function/tick.json)

Estos tags delegan en tres namespaces:
- tr
- totems
- qol

## 2) Flujo de arranque (load)
### TR
Archivo: [Datapack/data/tr/function/minecraft/load.mcfunction](../Datapack/data/tr/function/minecraft/load.mcfunction)
- Dispara una secuencia visual de carga (funciones 1..10 + mensaje final).
- Limpia y recrea scoreboards de TR.
- Limpia y recrea teams de TR.

Secuencia visual de arranque:
- Inicia en [Datapack/data/tr/function/minecraft/loading/1.mcfunction](../Datapack/data/tr/function/minecraft/loading/1.mcfunction)
- Termina en [Datapack/data/tr/function/minecraft/loading/10.mcfunction](../Datapack/data/tr/function/minecraft/loading/10.mcfunction)
- Mensaje final en [Datapack/data/tr/function/minecraft/loading/message.mcfunction](../Datapack/data/tr/function/minecraft/loading/message.mcfunction)

### Totems
Archivo: [Datapack/data/totems/function/minecraft/load.mcfunction](../Datapack/data/totems/function/minecraft/load.mcfunction)
- Crea scoreboards para deteccion de uso de totem y variantes cosmeticas.

### QoL
Archivo: [Datapack/data/qol/function/minecraft/load.mcfunction](../Datapack/data/qol/function/minecraft/load.mcfunction)
- Inicializa constantes del sistema de calculo de sueno dinamico.

## 3) Flujo recurrente (tick)
### TR
Archivo: [Datapack/data/tr/function/minecraft/tick.mcfunction](../Datapack/data/tr/function/minecraft/tick.mcfunction)
- Ejecuta reset total en próximo tick para jugadores sin tag update2 (delegacion a init_player).
- Inicializa scoreboards, storage unico tr:color y waypoint con valores base FFFFFF (una sola vez mediante tag update2).
- Recalcula teams cada tick para mantener prefijos/sufijos consistentes.
- Evalua triggers de jugador (AFK, prank, streaming, recording, color, ayuda, reglas, version).
- Emite mensaje de bienvenida para jugadores que regresan (leave).

### Totems
Archivo: [Datapack/data/totems/function/minecraft/tick.mcfunction](../Datapack/data/totems/function/minecraft/tick.mcfunction)
- Ejecuta deteccion de activacion de totems y mensajes contextuales.
- Entrega recetas de totems a todos los jugadores.

### QoL
Archivo: [Datapack/data/qol/function/minecraft/tick.mcfunction](../Datapack/data/qol/function/minecraft/tick.mcfunction)
- Ajusta velocidad de monturas (pig, strider, happy_ghast) segun item especial.
- Recalcula gamerule players_sleeping_percentage en tiempo real.

## 4) Pilares tecnicos
- Scoreboards como estado de sesion y estado persistente de jugadores.
- Teams para representar estados combinados (AFK + prank + recording + streaming).
- Triggers para UI de comandos del jugador sin permisos de administrador.
- Macros de funciones para construir comandos dinamicos (hex y gamerule).
- Recipes JSON para itemizacion personalizada (totems e item de velocidad).

## 5) Operaciones administrativas
El datapack incluye funciones de mantenimiento para recrear y limpiar estado:
- TR:
  - Clear scoreboards: [Datapack/data/tr/function/admin/clear_scoreboards.mcfunction](../Datapack/data/tr/function/admin/clear_scoreboards.mcfunction)
  - Create scoreboards: [Datapack/data/tr/function/admin/create_scoreboards.mcfunction](../Datapack/data/tr/function/admin/create_scoreboards.mcfunction)
  - Clear teams: [Datapack/data/tr/function/admin/clear_teams.mcfunction](../Datapack/data/tr/function/admin/clear_teams.mcfunction)
  - Create teams: [Datapack/data/tr/function/admin/create_teams.mcfunction](../Datapack/data/tr/function/admin/create_teams.mcfunction)
- Totems:
  - Clear scoreboards: [Datapack/data/totems/function/admin/clear_scoreboards.mcfunction](../Datapack/data/totems/function/admin/clear_scoreboards.mcfunction)
  - Create scoreboards: [Datapack/data/totems/function/admin/create_scoreboards.mcfunction](../Datapack/data/totems/function/admin/create_scoreboards.mcfunction)
- QoL:
  - Sleep init constants: [Datapack/data/qol/function/sleep/admin/load.mcfunction](../Datapack/data/qol/function/sleep/admin/load.mcfunction)
  - Sleep periodic calc: [Datapack/data/qol/function/sleep/admin/tick.mcfunction](../Datapack/data/qol/function/sleep/admin/tick.mcfunction)
  - Vehicle periodic boost: [Datapack/data/qol/function/vehicle_speeds/admin/tick.mcfunction](../Datapack/data/qol/function/vehicle_speeds/admin/tick.mcfunction)
