say [tr] Clearing scoreboards...

# Status scoreboards
scoreboard objectives remove prank-level
scoreboard objectives remove recording-status
scoreboard objectives remove streaming-status

say [tr] Scoreboards cleared


say [tr] Clearing triggers...

# Triggers
scoreboard objectives remove prank
scoreboard objectives remove streaming
scoreboard objectives remove recording

say [tr] Triggers cleared


say [tr] Resetting player data...

# Init Tag and reset scores for all players
tag @a remove tr_init
scoreboard players reset *

say [tr] Player data reset
