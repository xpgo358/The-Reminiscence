execute as @a if items entity @s weapon.* minecraft:carrot_on_a_stick[minecraft:item_model="snowball_on_a_stick"] if score @s snowonastick matches 0 on vehicle run attribute @s flying_speed base reset

execute as @a if items entity @s weapon.* minecraft:carrot_on_a_stick[minecraft:item_model="snowball_on_a_stick"] if score @s snowonastick matches 1 on vehicle run attribute @s flying_speed base set 0.075

execute as @a if score @s snowonastick matches 2 run scoreboard players set @s snowonastick 0