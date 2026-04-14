# QoL - Sueno Dinamico

## Objetivo
Ajustar players_sleeping_percentage en tiempo real para que el salto de noche sea proporcional a jugadores activos del Overworld.

## Archivos
- Init de constantes: [Datapack/data/qol/function/sleep/admin/load.mcfunction](../../../Datapack/data/qol/function/sleep/admin/load.mcfunction)
- Tick del submodulo: [Datapack/data/qol/function/sleep/admin/tick.mcfunction](../../../Datapack/data/qol/function/sleep/admin/tick.mcfunction)
- Calculo principal: [Datapack/data/qol/function/sleep/calculate.mcfunction](../../../Datapack/data/qol/function/sleep/calculate.mcfunction)
- Aplicacion gamerule por macro: [Datapack/data/qol/function/sleep/apply_macro.mcfunction](../../../Datapack/data/qol/function/sleep/apply_macro.mcfunction)

## Variables de trabajo
Objective:
- sleep_calc

Fake players usados:
- var_overworld_total
- var_overworld_active
- var_sleepers_needed
- var_sleep_percent
- var_sleepers_scaled
- var_div_remainder
- var_active_mod_four
- var_by_four
- var_percent_base
- var_mod_two
- var_bump_min

## Algoritmo documentado
1. Inicializa variables temporales.
2. Cuenta jugadores no espectador en Overworld como total.
3. Cuenta jugadores activos en Overworld excluyendo team AFK_OVERWORLD.
4. Calcula sleepers_needed = ceil(activos/4).
5. Aplica bump adicional cuando activos >= 10 y activos mod 4 = 2.
6. Si hay activos pero sleepers_needed <= 0, fuerza sleepers_needed = 1.
7. Calcula porcentaje con floor((sleepers_needed * 100) / total).
8. Si total <= 0, fija porcentaje en 100.
9. Clampa a 1..100.
10. Guarda en storage y aplica gamerule.

## Razon del floor en porcentaje
El propio codigo documenta que vanilla usa una conversion interna con ceil sobre el porcentaje; por eso usar floor evita exigir un durmiente extra en bordes.

## Interoperabilidad con TR
La exclusion de AFK depende de la asignacion correcta al team AFK_OVERWORLD:
- [Datapack/data/tr/function/admin/update_teams.mcfunction](../../../Datapack/data/tr/function/admin/update_teams.mcfunction)

Si TR no actualiza teams, QoL puede sobrecontar jugadores activos para dormir.
