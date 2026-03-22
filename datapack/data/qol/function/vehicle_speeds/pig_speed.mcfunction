# Toggle boost when a vanilla carrot-on-a-stick is used while riding a pig
execute as @a if entity @s[nbt={RootVehicle:{Entity:{id:"minecraft:pig"}}}] if items entity @s weapon.* minecraft:carrot_on_a_stick if score @s qol_pig_item_used > @s qol_pig_item_last run scoreboard players add @s qol_pig_boost 1
execute as @a[scores={qol_pig_boost=2..}] run scoreboard players set @s qol_pig_boost 0

# Keep last-use counters in sync for edge detection
execute as @a run scoreboard players operation @s qol_pig_item_last = @s qol_pig_item_used

# Rebuild pig boost modifier each tick so it never gets stuck
execute as @e[type=minecraft:pig] run attribute @s minecraft:movement_speed modifier remove qol:pig_boost
execute as @a[scores={qol_pig_boost=1..}] if entity @s[nbt={RootVehicle:{Entity:{id:"minecraft:pig"}}}] on vehicle run attribute @s minecraft:movement_speed modifier add qol:pig_boost 0.20 add_value

# Show boost state while mounted
execute as @a[scores={qol_pig_boost=1..}] if entity @s[nbt={RootVehicle:{Entity:{id:"minecraft:pig"}}}] run title @s actionbar [{"text":"Pig boost: ","color":"yellow"},{"text":"ON","color":"green","bold":true}]
execute as @a[scores={qol_pig_boost=0}] if entity @s[nbt={RootVehicle:{Entity:{id:"minecraft:pig"}}}] run title @s actionbar [{"text":"Pig boost: ","color":"yellow"},{"text":"OFF","color":"red","bold":true}]
