## Initialize all players (give default scores and color storage once)
execute as @a[tag=!update2] run function tr:control/init_player

# Update teams every tick so prefixes stay in sync
function tr:admin/update_teams

# Triggers
function tr:control/triggers

# Join message
execute as @a if score @s leave matches 1 run function tr:control/join_message