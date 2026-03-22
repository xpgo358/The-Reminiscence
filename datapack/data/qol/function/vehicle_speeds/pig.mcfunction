execute as @e[type=minecraft:pig] run attribute @s minecraft:movement_speed modifier remove qol:tick_skipper_boost
execute as @a[nbt={RootVehicle:{Entity:{id:"minecraft:pig"}}}] if items entity @s weapon.* minecraft:clock[item_model="tick_skipper"] on vehicle run attribute @s minecraft:movement_speed modifier add qol:tick_skipper_boost 0.1 add_value
