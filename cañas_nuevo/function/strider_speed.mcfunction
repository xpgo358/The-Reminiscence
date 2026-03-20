execute as @a if items entity @s weapon.* minecraft:warped_fungus_on_a_stick[minecraft:item_model="warped_fungus_on_a_stick"] if score @s fungusonastick matches 0 on vehicle run effect clear @s speed

execute as @a if items entity @s weapon.* minecraft:warped_fungus_on_a_stick[minecraft:item_model="warped_fungus_on_a_stick"] if score @s fungusonastick matches 1 on vehicle run effect give @s speed 2 1 true

execute as @a if score @s fungusonastick matches 2 run scoreboard players set @s fungusonastick 0