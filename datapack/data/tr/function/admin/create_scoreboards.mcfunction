tellraw @a {"text":"[tr] Creating scoreboards...","color":"yellow"}

# Scoreboards
scoreboard objectives add prank-level dummy
scoreboard objectives add recording-status dummy
scoreboard objectives add streaming-status dummy


# Join message prep
scoreboard objectives add leave minecraft.custom:minecraft.leave_game
scoreboard players set @a leave 1

tellraw @a {"text":"[tr] Scoreboards created","color":"green"}


# Health scoreboard for tab
scoreboard objectives add health health
scoreboard objectives setdisplay list health


tellraw @a {"text":"[tr] Creating triggers...","color":"yellow"}

# Triggers
scoreboard objectives add prank trigger
scoreboard objectives add streaming trigger
scoreboard objectives add recording trigger
scoreboard objectives add help trigger
scoreboard objectives add rules trigger

tellraw @a {"text":"[tr] Triggers created","color":"green"}