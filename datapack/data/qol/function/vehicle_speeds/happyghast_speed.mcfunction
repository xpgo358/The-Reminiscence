# Toggle state with each detected custom snow clock use while mounted on happy ghast
execute as @a[advancements={qol:vehicle_speeds/use_snow_clock=true}] if entity @s[nbt={RootVehicle:{Entity:{id:"minecraft:happy_ghast"}}}] run scoreboard players add @s qol_happyghast_boost 1
execute as @a[advancements={qol:vehicle_speeds/use_snow_clock=true}] run advancement revoke @s only qol:vehicle_speeds/use_snow_clock
execute as @a[scores={qol_happyghast_boost=2..}] run scoreboard players set @s qol_happyghast_boost 0

# Auto disable when dismounting happy ghast
execute as @a[scores={qol_happyghast_boost=1}] unless entity @s[nbt={RootVehicle:{Entity:{id:"minecraft:happy_ghast"}}}] run scoreboard players set @s qol_happyghast_boost 0

# Keep vehicle flying speed in sync with toggle state
execute as @a[scores={qol_happyghast_boost=0}] if entity @s[nbt={RootVehicle:{Entity:{id:"minecraft:happy_ghast"}}}] on vehicle run attribute @s minecraft:flying_speed base reset
execute as @a[scores={qol_happyghast_boost=1}] if entity @s[nbt={RootVehicle:{Entity:{id:"minecraft:happy_ghast"}}}] on vehicle run attribute @s minecraft:flying_speed base set 0.075

# Show boost state while mounted and holding the snow clock
execute as @a[scores={qol_happyghast_boost=0}] if entity @s[nbt={RootVehicle:{Entity:{id:"minecraft:happy_ghast"}}}] if items entity @s weapon.* minecraft:clock[minecraft:item_model="snowball_on_a_stick"] run title @s actionbar [{"text":"Happy ghast boost: ","color":"aqua"},{"text":"OFF","color":"red","bold":true}]
execute as @a[scores={qol_happyghast_boost=1}] if entity @s[nbt={RootVehicle:{Entity:{id:"minecraft:happy_ghast"}}}] if items entity @s weapon.* minecraft:clock[minecraft:item_model="snowball_on_a_stick"] run title @s actionbar [{"text":"Happy ghast boost: ","color":"aqua"},{"text":"ON","color":"green","bold":true}]
