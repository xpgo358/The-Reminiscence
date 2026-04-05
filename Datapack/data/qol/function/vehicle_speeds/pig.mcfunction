execute as @e[type=minecraft:pig] run attribute @s minecraft:movement_speed modifier remove qol:everything_on_a_stick_boost
execute as @a[nbt={RootVehicle:{Entity:{id:"minecraft:pig"}}}] if items entity @s weapon.* minecraft:clock[item_model="everything_on_a_stick"] on vehicle run attribute @s minecraft:movement_speed modifier add qol:everything_on_a_stick_boost 0.1 add_value
