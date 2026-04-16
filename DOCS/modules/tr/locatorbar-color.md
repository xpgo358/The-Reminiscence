# TR - Color del Locator Bar

## Objetivo
Permitir que cada jugador configure un color hexadecimal personalizado para su marcador de locator bar mediante un asistente guiado.

## Punto de entrada
Trigger inicial:
- /trigger color

## Modelo de almacenamiento
El color del locator bar se consolida en un unico storage plano:
- storage tr:color
- Campos: d1, d2, d3, d4, d5 y d6

No existe ya la nidificacion tr:color selected. El storage actua como fuente unica de verdad para el flujo de color y para la restauracion posterior.

Funciones implicadas:
- Inicio del flujo: [Datapack/data/tr/function/control/color/start.mcfunction](../../../Datapack/data/tr/function/control/color/start.mcfunction)
- Menu de seleccion: [Datapack/data/tr/function/control/color/menu.mcfunction](../../../Datapack/data/tr/function/control/color/menu.mcfunction)
- Captura de digito: [Datapack/data/tr/function/control/color/pick.mcfunction](../../../Datapack/data/tr/function/control/color/pick.mcfunction)
- Almacenamiento en storage: [Datapack/data/tr/function/control/color/store_hex_digit.mcfunction](../../../Datapack/data/tr/function/control/color/store_hex_digit.mcfunction)
- Confirmacion: [Datapack/data/tr/function/control/color/confirm.mcfunction](../../../Datapack/data/tr/function/control/color/confirm.mcfunction)
- Aplicacion final: [Datapack/data/tr/function/control/color/apply.mcfunction](../../../Datapack/data/tr/function/control/color/apply.mcfunction)
- Macro de aplicacion: [Datapack/data/tr/function/control/color/apply_macro.mcfunction](../../../Datapack/data/tr/function/control/color/apply_macro.mcfunction)

## Flujo funcional
1. start inicializa color-step=1, limpia color-d1..color-d6 y reescribe storage tr:color con d1..d6.
2. menu muestra paso actual y botones [0..F] usando click_event sobre /trigger colorpick.
3. pick guarda el valor de colorpick en el digito correspondiente al paso.
4. store_hex_digit convierte el numero 0..15 a caracter hex (0..9, A..F) dentro de storage tr:color.
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
- tr:color

Estructura del storage:
- d1..d6 contienen cada digito hexadecimal del color.
- El compound es plano; no usa subcompounds como selected.

Habilitacion de trigger colorpick:
- Se habilita solo cuando color-step esta entre 1 y 7.

Inicializacion de fabrica:
- En la inicializacion de jugadores de TR, color-d1..color-d6 se establece en 15 (hex F) y se aplica waypoint color FFFFFF.
- Storage tr:color se inicializa simultaneamente como compound plano con {d1: "F", d2: "F", ..., d6: "F"} para persistencia y compatibilidad de futuras migraciones de versiones.
- Referencia: [Datapack/data/tr/function/control/init_player.mcfunction](../../../Datapack/data/tr/function/control/init_player.mcfunction) (llamado desde [Datapack/data/tr/function/minecraft/tick.mcfunction](../../../Datapack/data/tr/function/minecraft/tick.mcfunction))

Integracion con AFK:
- AFK ON aplica waypoint gris 808080.
- AFK OFF restaura el color persistido usando storage tr:color con d1..d6.
- Referencia: [Datapack/data/tr/function/control/color/apply_saved.mcfunction](../../../Datapack/data/tr/function/control/color/apply_saved.mcfunction)

## Resultado visible
Aplicacion sobre locator bar del jugador:
- waypoint modify @s color hex <RRGGBB>

El comando final se construye por macro para evitar hardcode de combinaciones.
