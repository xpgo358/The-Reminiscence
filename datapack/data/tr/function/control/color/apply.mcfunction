execute if score @s color-d1 matches 0.. if score @s color-d2 matches 0.. if score @s color-d3 matches 0.. if score @s color-d4 matches 0.. if score @s color-d5 matches 0.. if score @s color-d6 matches 0.. run function tr:control/color/apply_macro with storage tr:color selected
scoreboard players set @s color-step 0
scoreboard players set @s colorpick -1
tellraw @s {"text":"Color aplicado","color":"green"}