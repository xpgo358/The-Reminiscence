# TR: funciones fallback

Las funciones fallback existen para administrar el estado del jugador cuando no conviene o no es posible usar triggers.

## Funciones disponibles

- `tr:fallback/prank/0` a `tr:fallback/prank/5`
- `tr:fallback/streaming/on`
- `tr:fallback/streaming/off`
- `tr:fallback/recording/on`
- `tr:fallback/recording/off`

## Para qué sirven

Permiten forzar el mismo resultado que darían los triggers públicos, pero desde un contexto de administración o automatización.

Casos típicos:

- Recuperar un estado roto tras una recarga.
- Ajustar manualmente el perfil de un jugador.
- Corregir un valor sin pedirle al jugador que interactúe.

## Filosofía

Estas funciones no duplican lógica por capricho. Son una capa de acceso alternativa sobre la misma fuente de verdad: los scoreboards de estado.

## Criterio de uso

Si el cambio puede hacer lo mismo que un trigger, la función fallback debería dejar exactamente el mismo estado final. La diferencia está solo en quién la ejecuta.