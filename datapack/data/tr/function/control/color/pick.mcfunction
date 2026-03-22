execute if score @s color-step matches 1 run scoreboard players operation @s color-d1 = @s colorpick
execute if score @s color-step matches 2 run scoreboard players operation @s color-d2 = @s colorpick
execute if score @s color-step matches 3 run scoreboard players operation @s color-d3 = @s colorpick
execute if score @s color-step matches 4 run scoreboard players operation @s color-d4 = @s colorpick
execute if score @s color-step matches 5 run scoreboard players operation @s color-d5 = @s colorpick
execute if score @s color-step matches 6 run scoreboard players operation @s color-d6 = @s colorpick
function tr:control/color/store_hex_digit
tellraw @s [{"text":"OK","color":"green"}]
scoreboard players add @s color-step 1
scoreboard players set @s colorpick -1
execute if score @s color-step matches 7 run function tr:control/color/confirm
execute if score @s color-step matches ..6 run function tr:control/color/menu