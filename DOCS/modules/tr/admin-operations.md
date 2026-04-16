# TR - Administracion y Operacion

## Objetivo
Documentar comandos de operacion para reinicio, reconstruccion y anuncios especiales del namespace TR.

## Funciones administrativas principales
### Reset de scoreboards y reinicializacion forzada
- [Datapack/data/tr/function/admin/clear_scoreboards.mcfunction](../../../Datapack/data/tr/function/admin/clear_scoreboards.mcfunction)

Efectos:
1. Elimina objectives de estado y triggers de TR.
2. Elimina scoreboard de health en tab.
3. Quita tag update2 de todos los jugadores (fuerza reinit de jugador en próximo tick).
4. Quita tag update1 legado (compatibilidad pre-existente).
5. Ejecuta scoreboard players reset *.

Uso recomendado:
- Antes de recrear sistema completo en entornos de test.
- Al ejecutar: todos los jugadores recibirán reset total (scoreboards + storage + waypoint) en próximo tick.
- Siempre seguir con create_scoreboards para mantener consistencia.

### Creacion de scoreboards
- [Datapack/data/tr/function/admin/create_scoreboards.mcfunction](../../../Datapack/data/tr/function/admin/create_scoreboards.mcfunction)

Efectos:
- Crea objectives de estado, triggers y leave.
- Crea health y lo muestra en tab list.

### Reset de teams
- [Datapack/data/tr/function/admin/clear_teams.mcfunction](../../../Datapack/data/tr/function/admin/clear_teams.mcfunction)

Efectos:
- Elimina teams AFK y los 24 teams combinados prank/record/stream.
- Ejecuta team leave @a para limpiar membresias residuales.

### Creacion de teams
- [Datapack/data/tr/function/admin/create_teams.mcfunction](../../../Datapack/data/tr/function/admin/create_teams.mcfunction)

Efectos:
- Recrea teams AFK por dimension.
- Recrea matriz de 24 teams para combinaciones sociales.

### Reasignacion de teams en runtime
- [Datapack/data/tr/function/admin/update_teams.mcfunction](../../../Datapack/data/tr/function/admin/update_teams.mcfunction)

Efectos:
- Limpia membresia actual.
- Recalcula pertenencia segun scoreboards y dimension.

## Operacion de challenges
### Disparo de anuncio
- [Datapack/data/tr/function/admin/challenges/new.mcfunction](../../../Datapack/data/tr/function/admin/challenges/new.mcfunction)

Comportamiento:
- Inicia secuencia de carga de challenge por schedule.

Secuencia visual:
- [Datapack/data/tr/function/admin/challenges/loading/1.mcfunction](../../../Datapack/data/tr/function/admin/challenges/loading/1.mcfunction) ... [Datapack/data/tr/function/admin/challenges/loading/9.mcfunction](../../../Datapack/data/tr/function/admin/challenges/loading/9.mcfunction)
- Mensaje final: [Datapack/data/tr/function/admin/challenges/loading/message.mcfunction](../../../Datapack/data/tr/function/admin/challenges/loading/message.mcfunction)

## Procedimientos operativos sugeridos
### Reinicio completo de TR
1. Ejecutar tr:admin/clear_teams
2. Ejecutar tr:admin/clear_scoreboards
3. Ejecutar tr:admin/create_scoreboards
4. Ejecutar tr:admin/create_teams

### Solo refresco visual
1. Ejecutar tr:admin/update_teams

## Riesgos y notas
- clear_scoreboards hace reset global de scores de jugadores (scoreboard players reset *).
- Conviene usar operaciones destructivas fuera de eventos activos.
- Tras clear_* siempre recrear create_* para volver a estado consistente.
