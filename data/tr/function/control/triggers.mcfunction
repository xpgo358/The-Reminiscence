## Detect triggers

# Update Prank Level (0-5)
execute as @a[scores={prank=0..5}] run scoreboard players operation @s prank-level = @s prank

# Update Streaming (0=No, 1=Yes)
execute as @a[scores={streaming=0..1}] run scoreboard players operation @s streaming-status = @s streaming

# Update Recording (0=No, 1=Yes)
execute as @a[scores={recording=0..1}] run scoreboard players operation @s recording-status = @s recording

# Help
execute as @a[scores={help=1..}] run tellraw @s {"text":"[tr] Help has been triggered!","color":"yellow"}

# Rules
execute as @a[scores={rules=1..}] run tellraw @s {"text":"[tr] Rules have been triggered!","color":"yellow"}

## Reset and Re-enable triggers for everyone every tick

# Prank level
scoreboard players set @a prank -1
scoreboard players enable @a prank

# Streaming
scoreboard players set @a streaming -1
scoreboard players enable @a streaming

# Recording
scoreboard players set @a recording -1
scoreboard players enable @a recording

# Help
scoreboard players reset @a help
scoreboard players enable @a help

# Rules
scoreboard players reset @a rules
scoreboard players enable @a rules