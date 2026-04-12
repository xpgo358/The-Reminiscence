#tellraw @a {"text":"[tr] Limpiando scoreboards y reiniciando datos de jugadores...","color":"yellow"}

# Status scoreboards
scoreboard objectives remove prank-level
scoreboard objectives remove recording-status
scoreboard objectives remove streaming-status
scoreboard objectives remove afk-status
scoreboard objectives remove color-step
scoreboard objectives remove color-d1
scoreboard objectives remove color-d2
scoreboard objectives remove color-d3
scoreboard objectives remove color-d4
scoreboard objectives remove color-d5
scoreboard objectives remove color-d6

# Triggers
scoreboard objectives remove prank
scoreboard objectives remove streaming
scoreboard objectives remove recording
scoreboard objectives remove help
scoreboard objectives remove rules
scoreboard objectives remove version
scoreboard objectives remove afk
scoreboard objectives remove color
scoreboard objectives remove colorpick

# Health scoreboard
scoreboard objectives remove health


# Init Tag and reset scores for all players
tag @a remove update1
scoreboard players reset *

#tellraw @a {"text":"[tr] Scoreboards limpiados y datos de jugadores reiniciados","color":"green"}
