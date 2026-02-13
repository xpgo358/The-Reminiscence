tellraw @a {"text":"[tr] Clearing scoreboards, and resetting player data...","color":"yellow"}

# Status scoreboards
scoreboard objectives remove prank-level
scoreboard objectives remove recording-status
scoreboard objectives remove streaming-status

# Triggers
scoreboard objectives remove prank
scoreboard objectives remove streaming
scoreboard objectives remove recording
scoreboard objectives remove help
scoreboard objectives remove rules


# Init Tag and reset scores for all players
tag @a remove tr_init
scoreboard players reset *

tellraw @a {"text":"[tr] Scoreboards cleared, and player data reset","color":"green"}
