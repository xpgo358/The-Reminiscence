## Iteration 2026-04-17 (v2.0.0 + Crisho Golden Dandelion)

### Files changed
- README.md
- DOCS/README.md
- DOCS/modules/tr/player-commands.md
- Datapack/pack.mcmeta
- Datapack/data/tr/function/minecraft/loading/message.mcfunction
- Datapack/data/tr/function/control/triggers.mcfunction
- Datapack/data/totems/recipe/crisho_totem.json

### Context
Subir la version del proyecto/datapack a 2.0.0 y actualizar el totem de Crisho para que refleje la tematica de Golden Dandelion sin cambiar el flujo funcional del modulo.

### General changes performed
- Se actualizan todas las referencias de version visibles encontradas en metadata, README, docs y mensajes in-game de TR de `1.8.2` a `2.0.0`.
- Se mantiene el formato de pack (`min_format/max_format`) sin cambios para preservar compatibilidad de la version de Minecraft objetivo.
- Se actualiza el nombre visible del resultado en la receta de Crisho a `Golden Dandelion`, manteniendo el modelo `crisho_totem` y el ingrediente `minecraft:golden_dandelion`.

### High-level implementation approach
- Cambios puntuales sobre archivos ya existentes, evitando refactors o renombres de scoreboards/funciones.
- Mantener intacto el comportamiento de deteccion/uso de totems y solo ajustar metadata/texto/recipe output.

### Behavior summary
- El datapack y sus mensajes de version ahora reportan `v2.0.0`.
- El totem de Crisho sigue funcionando igual, pero su resultado queda nombrado como `Golden Dandelion`, coherente con su ingrediente.

### Assumptions and risks
- Se asume que `2.0.0` es version semantica del proyecto y no requiere cambios de `gameVersion` ni de `min_format/max_format`.
- No se renombro `used_oldtotem` por compatibilidad con scoreboards existentes; es un identificador interno y no afecta al jugador.

## Iteration 2026-04-16 (v2 - Final)

### Files changed
- Datapack/data/tr/function/minecraft/tick.mcfunction (refactorizado, sin migración - reset total)
- Datapack/data/tr/function/control/init_player.mcfunction
- Datapack/data/tr/function/control/triggers.mcfunction
- Datapack/data/tr/function/control/color/apply_saved.mcfunction
- Datapack/data/tr/function/admin/clear_scoreboards.mcfunction

### Context
Refactorizar la inicializacion de jugador a un archivo dedicado y añadir persistencia del color FFFFFF en storage. Sin migración de tags - reset total para todos.

### General changes performed
- Se extrae toda la lógica de inicialización a `tr:control/init_player.mcfunction`.
- Se simplifica `tick.mcfunction` para llamar a esa función desde el selector `@a[tag=!update2]` (sin migración).
- Se añade inicialización del storage `tr:color selected` con FFFFFF para compatibilidad con cambios de versión futuros.
- Todos los jugadores (nuevos y existentes) se reinician cuando pierdan tag update2, reciben almacenamiento de color persistido desde ese tick.

### High-level implementation approach
- Crear archivo modular `init_player.mcfunction` que centraliza toda la lógica de init.
- Incluir data modify para storage al momento de inicializar.
- Mantener tick.mcfunction limpio y legible.
- Eliminar lógica de migración update1->update2: reset total es la estrategia.

### Behavior summary
- Cualquier jugador sin tag update2: scoreboards + storage + waypoint inicializados a FFFFFF.
- No hay migración silenciosa - al limpiar admin o por cambio de versión, todos reinician frescos.
- Codebase: más mantenible al separar inicialización de flujo principal.

### Assumptions and risks
- Storage `tr:color selected` es global; asignación por init_player es segura (ocurre una sola vez por ciclo update2).
- Todos los jugadores existentes se reinician en el primer tick donde no tengan update2.

## Iteration 2026-04-16 (color storage consolidation)

### Files changed
- Datapack/data/tr/function/control/color/store_hex_digit.mcfunction
- Datapack/data/tr/function/control/color/apply_saved.mcfunction
- Datapack/data/tr/function/control/color/menu.mcfunction
- Datapack/data/tr/function/control/color/confirm.mcfunction
- Datapack/data/tr/function/control/color/apply.mcfunction
- Datapack/data/tr/function/control/color/store_hex_digit_new.mcfunction (deleted)
- DOCS/modules/tr/locatorbar-color.md
- DOCS/modules/tr/overview.md

### Context
Consolidar por completo el almacenamiento de color para eliminar el esquema antiguo con `selected` y dejar un unico flujo basado en `storage tr:color`.

### General changes performed
- Se reemplaza `store_hex_digit.mcfunction` por la version consolidada que escribe `d1..d6` directamente en `storage tr:color`.
- Se reescribe `apply_saved.mcfunction` para convertir scoreboards `color-d1..color-d6` a `storage tr:color d1..d6`, ejecutar la macro con ese storage y caer a `FFFFFF` cuando faltan datos validos.
- Se eliminan las referencias residuales a `selected` en el menu, confirmacion y aplicacion de color.
- Se borra el archivo temporal `store_hex_digit_new.mcfunction`.
- Se actualiza la documentacion de TR para reflejar el storage consolidado.

### High-level implementation approach
- Tomar como fuente de verdad el storage plano `tr:color` con claves `d1..d6`.
- Mantener la interfaz existente del flujo de color, pero apuntarla al storage consolidado.
- Usar `FFFFFF` como valor de seguridad cuando la reconstruccion desde scoreboards no es valida.

### Behavior summary
- El flujo de color ya no depende de `selected`.
- La aplicacion final y la restauracion AFK usan `storage tr:color` directamente.
- Si faltan datos de color validos, el waypoint cae a `FFFFFF`.

### Assumptions and risks
- Se asume que `storage tr:color` es el unico punto persistente necesario para este modulo.
- La verificacion por scoreboards puede disparar mas de una vez el fallback a `FFFFFF`, pero el resultado visual es el esperado.
