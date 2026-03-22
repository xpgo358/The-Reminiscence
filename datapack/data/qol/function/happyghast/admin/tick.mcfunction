execute as @e[type=minecraft:happy_ghast] run attribute @s minecraft:flying_speed modifier remove qol:snowball_on_a_stick_boost
execute as @a if entity @s[nbt={RootVehicle:{Entity:{id:"minecraft:happy_ghast"}}}] if items entity @s weapon.* minecraft:clock[item_model="snowball_on_a_stick"] on vehicle run attribute @s minecraft:flying_speed modifier add qol:snowball_on_a_stick_boost 0.025 add_value
