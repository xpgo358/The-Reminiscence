execute as @e[type=minecraft:happy_ghast] run attribute @s minecraft:flying_speed modifier remove qol:tick_skipper_boost
execute as @a[nbt={RootVehicle:{Entity:{id:"minecraft:happy_ghast"}}}] if items entity @s weapon.* minecraft:clock[item_model="tick_skipper"] on vehicle run attribute @s minecraft:flying_speed modifier add qol:tick_skipper_boost 0.025 add_value
