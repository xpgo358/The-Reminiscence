## Trigger enable

scoreboard players enable @a prank
scoreboard players enable @a recording
scoreboard players enable @a streaming

## Initialize new players (give default scores once)
execute as @a[tag=!tr_init] run scoreboard players set @s prank 0
execute as @a[tag=!tr_init] run scoreboard players set @s recording 0
execute as @a[tag=!tr_init] run scoreboard players set @s streaming 0
execute as @a[tag=!tr_init] run tag @s add tr_init



## Update teams every tick so prefixes stay in sync
function tr:update_teams



## Copiando a ernesto
execute as @a unless score @s recording matches 1 run scoreboard players set @s recording 0
execute as @a unless score @s streaming matches 1 run scoreboard players set @s streaming 0
execute as @a unless score @s prank matches 0..5 run scoreboard players set @s prank 0