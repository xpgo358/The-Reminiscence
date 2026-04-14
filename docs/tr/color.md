# TR: selector de color HEX

El selector de color permite construir un color hexadecimal de seis dígitos desde el propio juego, paso a paso y con confirmación visual.

## Objetivo

El sistema convierte una secuencia de seis elecciones en una cadena hexadecimal válida que luego se usa en el comando final de aplicación.

## Archivos implicados

- `tr:control/color/start`
- `tr:control/color/menu`
- `tr:control/color/pick`
- `tr:control/color/store_hex_digit`
- `tr:control/color/preview_macro`
- `tr:control/color/confirm`
- `tr:control/color/confirm_macro`
- `tr:control/color/apply`
- `tr:control/color/apply_macro`

## Flujo completo

### 1. Inicio

`start` reinicia el estado del selector:

- `color-step` vuelve a `1`.
- `color-d1` a `color-d6` se preparan para recibir datos.
- Se limpia el `storage tr:color selected`.
- Se abre el menú visual.

### 2. Menú

`menu` muestra el paso actual y los botones `[0]` a `[F]`.

El diseño está pensado para que el jugador entienda dos cosas al instante:

- En qué paso va.
- Qué dígito puede elegir ahora.

### 3. Elección

`pick` copia el valor del trigger al scoreboard del dígito actual y luego lo exporta al storage como letra hexadecimal.

Ese doble almacenamiento es importante:

- El scoreboard sirve para lógica interna y validación.
- El storage sirve para componer el texto final que consumirá la macro.

### 4. Confirmación

Al completar los seis pasos, `confirm` muestra los botones de confirmación y rehacer. La idea es evitar que el jugador aplique un color incorrecto por pulsar mal una sola vez.

### 5. Aplicación

Si el jugador confirma, `apply` llama a la macro final y resetea el estado del selector.

## Por qué usar storage

El storage permite conservar una representación textual del color completo sin tener que reconstruirla cada vez desde scoreboards. Eso simplifica la macro y hace más transparente el resultado final.

## Ventajas del diseño

- No requiere escribir el color a mano.
- Reduce errores al usar botones clicables.
- Permite una vista previa clara antes de aplicar el valor final.
- Se adapta bien a un flujo de chat interactivo.