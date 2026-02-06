execute as @s if score @s streaming matches 0 run scoreboard players set @s streaming 1
execute as @s if score @s streaming matches 1 run scoreboard players set @s streaming 0
function tr:update_teams
