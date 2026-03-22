# Toggle boost when a vanilla warped-fungus-on-a-stick is used while riding a strider
execute as @a if entity @s[nbt={RootVehicle:{Entity:{id:"minecraft:strider"}}}] if items entity @s weapon.* minecraft:warped_fungus_on_a_stick if score @s qol_strider_item_used > @s qol_strider_item_last run scoreboard players add @s qol_strider_boost 1
execute as @a[scores={qol_strider_boost=2..}] run scoreboard players set @s qol_strider_boost 0

# Keep last-use counters in sync for edge detection
execute as @a run scoreboard players operation @s qol_strider_item_last = @s qol_strider_item_used

# Rebuild strider boost modifier each tick so it never gets stuck
execute as @e[type=minecraft:strider] run attribute @s minecraft:movement_speed modifier remove qol:strider_boost
execute as @a[scores={qol_strider_boost=1..}] if entity @s[nbt={RootVehicle:{Entity:{id:"minecraft:strider"}}}] on vehicle run attribute @s minecraft:movement_speed modifier add qol:strider_boost 0.20 add_value

# Show boost state while mounted and holding warped fungus on a stick
execute as @a[scores={qol_strider_boost=1..}] if entity @s[nbt={RootVehicle:{Entity:{id:"minecraft:strider"}}}] if items entity @s weapon.* minecraft:warped_fungus_on_a_stick run title @s actionbar [{"text":"Strider boost: ","color":"gold"},{"text":"ON","color":"green","bold":true}]
execute as @a[scores={qol_strider_boost=0}] if entity @s[nbt={RootVehicle:{Entity:{id:"minecraft:strider"}}}] if items entity @s weapon.* minecraft:warped_fungus_on_a_stick run title @s actionbar [{"text":"Strider boost: ","color":"gold"},{"text":"OFF","color":"red","bold":true}]
