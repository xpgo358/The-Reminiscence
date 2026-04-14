# TR - Color del Locator Bar

## Objetivo
Permitir que cada jugador configure un color hexadecimal personalizado para su marcador de locator bar mediante un asistente guiado.

## Punto de entrada
Trigger inicial:
- /trigger color

Funciones implicadas:
- Inicio del flujo: [Datapack/data/tr/function/control/color/start.mcfunction](../../../Datapack/data/tr/function/control/color/start.mcfunction)
- Menu de seleccion: [Datapack/data/tr/function/control/color/menu.mcfunction](../../../Datapack/data/tr/function/control/color/menu.mcfunction)
- Captura de digito: [Datapack/data/tr/function/control/color/pick.mcfunction](../../../Datapack/data/tr/function/control/color/pick.mcfunction)
- Almacenamiento en storage: [Datapack/data/tr/function/control/color/store_hex_digit.mcfunction](../../../Datapack/data/tr/function/control/color/store_hex_digit.mcfunction)
- Confirmacion: [Datapack/data/tr/function/control/color/confirm.mcfunction](../../../Datapack/data/tr/function/control/color/confirm.mcfunction)
- Aplicacion final: [Datapack/data/tr/function/control/color/apply.mcfunction](../../../Datapack/data/tr/function/control/color/apply.mcfunction)
- Macro de aplicacion: [Datapack/data/tr/function/control/color/apply_macro.mcfunction](../../../Datapack/data/tr/function/control/color/apply_macro.mcfunction)

## Flujo funcional
1. start inicializa color-step=1, limpia color-d1..color-d6 y storage tr:color selected.
2. menu muestra paso actual y botones [0..F] usando click_event sobre /trigger colorpick.
3. pick guarda el valor de colorpick en el digito correspondiente al paso.
4. store_hex_digit convierte el numero 0..15 a caracter hex (0..9, A..F) en storage.
5. Se muestra previsualizacion con color calculado.
6. Al completar 6 digitos, confirm permite:
   - Confirmar (colorpick=1)
   - Rehacer (colorpick=0)
7. apply ejecuta macro de waypoint modify con el hex final.

## Estado y controles
Scoreboards:
- color-step
- color-d1..color-d6
- color
- colorpick

Storage:
- tr:color selected

Habilitacion de trigger colorpick:
- Se habilita solo cuando color-step esta entre 1 y 7.

## Resultado visible
Aplicacion sobre locator bar del jugador:
- waypoint modify @s color hex <RRGGBB>

El comando final se construye por macro para evitar hardcode de combinaciones.
