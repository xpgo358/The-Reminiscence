# The Reminiscence Datapack



**Version:** 2.2.1

A modular Minecraft Java Edition datapack that enhances survival multiplayer with social features, cosmetic totems, and quality-of-life improvements.

## Quick Start

- **[Full Documentation](./DOCS/README.md)** — Complete architecture, modules, and implementation details
- **Version:** 2.2.1 (Pack Format: 101)
- **Modules:** TR (social system), Totems (cosmetics), QoL (quality of life)

## What's Included

### TR Module
Social and player state system featuring:
- **AFK Status** — Track and display when players are away, with persistent actionbar notifications
- **Prank Levels** — Set your mischief level (0-5) for dynamic team displays
- **Streaming & Recording** — Toggle statuses with automatic team prefix updates
- **Locator Bar Colors** — Customize your locator waypoint with hex color picker

### Totems Module
30+ cosmetically personalized totems with unique crafting recipes and contextual messages:
- **NutriTotem** — Craft with totem + cobblestone
- **Gema Dorada** — Craft with totem + raw_gold
- Plus 28 more character-themed totems

### QoL Module
Quality-of-life features:
- **Dynamic Sleep** — Reduce required sleepers based on percentage (0%, 1-99%, 100%)
- **Vehicle Speed Boost** — Unified item system for mounting speed enhancements

## Architecture

Entry Points:
- **Load:** Initializes scoreboards, teams, recipes, and state on datapack load
- **Tick:** Runs social updates, totem detection, AFK tracking, and other recurring logic

Order of Execution:
1. TR module (load, then tick)
2. Totems module (load, then tick)
3. QoL module (load, then tick)

See [DOCS/architecture.md](./DOCS/architecture.md) for detailed diagrams and implementation patterns.

## Configuration

The datapack respects Minecraft gamerules:
- **players_sleeping_percentage** — Controls sleep detection in QoL module
- **showDeathMessages** — Affects totem message display behavior

See [DOCS/README.md](./DOCS/README.md) for detailed configuration and compatibility information.

## Project Structure

```
├── README.md (this file)
├── DOCS/
│   ├── README.md (detailed documentation hub)
│   ├── architecture.md (system design and flow)
│   └── modules/ (TR, Totems, QoL module docs)
├── Datapack/
│   ├── pack.mcmeta
│   └── data/
│       ├── minecraft/ (load & tick tags)
│       ├── tr/ (social system)
│       ├── totems/ (cosmetic totems)
│       └── qol/ (quality of life)
└── .github/
    └── agents/ (custom agent definitions)
```

## Documentation

- **[Full Documentation Hub](./DOCS/README.md)** — Start here for complete details
- **[TR Module Overview](./DOCS/modules/tr.md)** — Social features and state management
- **[Totems Module Overview](./DOCS/modules/totems.md)** — Cosmetic totems system
- **[QoL Module Overview](./DOCS/modules/qol.md)** — Quality of life enhancements
- **[Architecture Details](./DOCS/architecture.md)** — System design and execution order

## Compatibility

- **Minecraft Version:** Java Edition (Pack Format 101)
- **Multiplayer:** Designed for survival servers with multiple players
- **Mods:** Generally compatible with other datapacks and mods; no known conflicts

## Support & Feedback

This is a community-driven datapack. For issues, suggestions, or feature requests, refer to the project repository or community channels.

---

**Last Updated:** Version 2.2.2
