# TR: equipos y presencia

Los equipos de `tr` se usan para mostrar estado en el TAB, organizar la presencia AFK y mantener sincronizados los jugadores con su contexto actual.

## Tipos de equipos

### AFK

Si `afk-status = 1`, el jugador entra en uno de estos equipos según dimensión:

| Team | Uso | Sufijo visual |
|---|---|---|
| `AFK_OVERWORLD` | AFK en el Overworld | `⌀ ☀` |
| `AFK_NETHER` | AFK en el Nether | `⌀ 🔥` |
| `AFK_END` | AFK en el End | `⌀ ✦` |

El color del nombre se mantiene gris para dejar el estado como anotación secundaria, no como identidad principal.

### Estado combinado

Cuando el jugador no está AFK, se le asigna a una de las 24 combinaciones posibles de prank, recording y streaming:

```text
t_p{prank}_r{recording}_s{streaming}
```

El sistema cubre:

- 6 niveles de prank
- 2 estados de recording
- 2 estados de streaming

## Qué representa el sufijo

El sufijo del equipo no es solo decorativo. Resume visualmente el estado del jugador para que el servidor pueda leerse de un vistazo.

- El número romano o símbolo central refleja el prank.
- Los puntos de color reflejan streaming y recording.
- Los tooltips explican el significado de cada estado.

## Prioridad de asignación

AFK siempre tiene prioridad. Si un jugador está marcado como AFK, no se le asigna un equipo de estado combinado aunque tenga prank, streaming o recording activos.

## Actualización continua

`tr:admin/update_teams` se ejecuta cada tick y aplica un patrón conservador:

1. Vacía las membresías de equipo.
2. Vuelve a asignar cada jugador.
3. Garantiza que el estado visual coincida con los scoreboards actuales.

Eso evita inconsistencias cuando un jugador cambia de dimensión o de estado en mitad de sesión.

## Buen criterio de uso

La información de equipo está pensada para ser legible sin abrir menús ni comandos. Si un jugador mira el TAB, debe entender rápido si alguien está AFK, grabando o en directo.