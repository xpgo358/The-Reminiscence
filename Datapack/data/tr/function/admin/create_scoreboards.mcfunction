#tellraw @a {"text":"[tr] Creando scoreboards...","color":"yellow"}

# Scoreboards
scoreboard objectives add prank-level dummy
scoreboard objectives add recording-status dummy
scoreboard objectives add streaming-status dummy
scoreboard objectives add afk-status dummy
scoreboard objectives add color-step dummy
scoreboard objectives add color-d1 dummy
scoreboard objectives add color-d2 dummy
scoreboard objectives add color-d3 dummy
scoreboard objectives add color-d4 dummy
scoreboard objectives add color-d5 dummy
scoreboard objectives add color-d6 dummy

# Join message prep
scoreboard objectives add leave minecraft.custom:minecraft.leave_game
scoreboard players set @a leave 0

#tellraw @a {"text":"[tr] Scoreboards creados","color":"green"}


# Health scoreboard for tab
scoreboard objectives add health health
scoreboard objectives setdisplay list health


#tellraw @a {"text":"[tr] Creando triggers...","color":"yellow"}

# Triggers
scoreboard objectives add prank trigger
scoreboard objectives add streaming trigger
scoreboard objectives add recording trigger
scoreboard objectives add help trigger
scoreboard objectives add rules trigger
scoreboard objectives add version trigger
scoreboard objectives add afk trigger
scoreboard objectives add color trigger
scoreboard objectives add colorpick trigger
#tellraw @a {"text":"[tr] Triggers creados","color":"green"}