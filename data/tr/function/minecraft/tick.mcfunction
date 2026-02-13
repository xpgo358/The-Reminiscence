## Initialize new players (give default scores once)
execute as @a[tag=!tr_init] run scoreboard players set @s prank-level 0
execute as @a[tag=!tr_init] run scoreboard players set @s recording-status 0
execute as @a[tag=!tr_init] run scoreboard players set @s streaming-status 0
execute as @a[tag=!tr_init] run tag @s add tr_init

# Update teams every tick so prefixes stay in sync
function tr:admin/update_teams

# Triggers
function tr:control/triggers