execute as @s if score @s recording matches 0 run scoreboard players set @s recording 1
execute as @s if score @s recording matches 1 run scoreboard players set @s recording 0
function tr:update_teams
