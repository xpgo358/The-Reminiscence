## Initialize new player with default scores and color storage

# Scoreboards - state defaults
scoreboard players set @s prank-level 0
scoreboard players set @s recording-status 0
scoreboard players set @s streaming-status 0
scoreboard players set @s afk-status 0

# Scoreboards - color digits (hex F = 15)
scoreboard players set @s color-d1 15
scoreboard players set @s color-d2 15
scoreboard players set @s color-d3 15
scoreboard players set @s color-d4 15
scoreboard players set @s color-d5 15
scoreboard players set @s color-d6 15

# Storage - color default FFFFFF (consolidated single storage)
data merge storage tr:color {d1: "F", d2: "F", d3: "F", d4: "F", d5: "F", d6: "F"}

# Apply FFFFFF to waypoint
waypoint modify @s color hex FFFFFF

# Mark initialization done
tag @s add update2
