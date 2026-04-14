# The Reminiscence SMP

Datapack principal del servidor, organizado por namespaces y con documentación separada por sistema.

## Version actual
1.8.1

## Resumen

- Minecraft objetivo: latest
- Pack format: latest
- Namespaces principales: `tr`, `totems` y `qol`

## Orden de ejecución

- Load: `tr` -> `totems` -> `qol`
- Tick: `tr` -> `totems` -> `qol`

## Documentación

- [Sistema TR](docs/tr.md)
- [TR: ciclo de carga y limpieza](docs/tr/lifecycle.md)
- [TR: scoreboards y estado de jugador](docs/tr/scoreboards.md)
- [TR: equipos y presencia](docs/tr/equipos.md)
- [TR: triggers y mensajes](docs/tr/triggers.md)
- [TR: selector de color HEX](docs/tr/color.md)
- [TR: challenges](docs/tr/challenges.md)
- [TR: funciones fallback](docs/tr/fallback.md)
- [Tótems personalizados](docs/totems.md)
- [Introducción a QOL](docs/qol.md)
- [Sistema de dormir](docs/qol/dormir.md)
- [Velocidades de vehículos](docs/qol/vehiculos.md)

## Estructura del datapack

```text
Datapack/
├── pack.mcmeta
├── spyglass.json
└── data/
	├── minecraft/tags/function/
	│   ├── load.json
	│   └── tick.json
	├── tr/
	├── qol/
	└── totems/
```

## Qué hace cada bloque

- `tr`: ciclo de carga, estados de jugador, equipos, triggers, selector de color, mensajes y utilidades de administración.
- `totems`: detección de tótems personalizados, desbloqueo de recetas y mensajes al usarlos.
- `qol`: ajustes de calidad de vida, incluyendo el cálculo dinámico de sueño y los boosts de vehículos.