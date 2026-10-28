title @s actionbar [{"text":"Intenta no construir, estás a más de 10k","color":"red"}]
execute if score @s 10kwarning matches 0 run playsound minecraft:block.note_block.bass master @s ~ ~ ~ 1000000 0.7
scoreboard players set @s 10kwarning 2