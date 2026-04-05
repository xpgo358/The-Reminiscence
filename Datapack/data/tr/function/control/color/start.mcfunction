scoreboard players set @s color-step 1
scoreboard players set @s color-d1 -1
scoreboard players set @s color-d2 -1
scoreboard players set @s color-d3 -1
scoreboard players set @s color-d4 -1
scoreboard players set @s color-d5 -1
scoreboard players set @s color-d6 -1
scoreboard players set @s colorpick -1
scoreboard players enable @s colorpick
data remove storage tr:color selected
data modify storage tr:color selected.d1 set value "0"
data modify storage tr:color selected.d2 set value "0"
data modify storage tr:color selected.d3 set value "0"
data modify storage tr:color selected.d4 set value "0"
data modify storage tr:color selected.d5 set value "0"
data modify storage tr:color selected.d6 set value "0"
tellraw @s [{"text":"\nColor HEX ","color":"yellow"},{"text":"(6 pasos)","color":"gold"}]
function tr:control/color/menu