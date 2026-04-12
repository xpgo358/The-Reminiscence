# Dynamic vanilla sleep percentage based on active overworld players.
# Uses AFK_OVERWORLD team to exclude AFK players from sleeper target.

scoreboard players set var_overworld_total sleep_calc 0
scoreboard players set var_overworld_active sleep_calc 0
scoreboard players set var_sleepers_needed sleep_calc 0
scoreboard players set var_sleep_percent sleep_calc 100
scoreboard players set var_sleepers_scaled sleep_calc 0
scoreboard players set var_div_remainder sleep_calc 0
scoreboard players set var_active_mod_four sleep_calc 0

# Overworld non-spectator players
execute as @a[gamemode=!spectator] at @s if dimension minecraft:overworld run scoreboard players add var_overworld_total sleep_calc 1

# Active overworld players (exclude AFK_OVERWORLD team)
execute as @a[gamemode=!spectator,team=!AFK_OVERWORLD] at @s if dimension minecraft:overworld run scoreboard players add var_overworld_active sleep_calc 1

# sleepers_needed = ceil(overworld_active / 4)
execute if score var_overworld_total sleep_calc matches 1.. run scoreboard players operation var_sleepers_needed sleep_calc = var_overworld_active sleep_calc
execute if score var_overworld_total sleep_calc matches 1.. run scoreboard players add var_sleepers_needed sleep_calc 3
execute if score var_overworld_total sleep_calc matches 1.. run scoreboard players operation var_sleepers_needed sleep_calc /= var_by_four sleep_calc

# Forgiving bump calibrated in chat:
# if active >= 10 and active mod 4 == 2, require one extra sleeper.
execute if score var_overworld_total sleep_calc matches 1.. run scoreboard players operation var_active_mod_four sleep_calc = var_overworld_active sleep_calc
execute if score var_overworld_total sleep_calc matches 1.. run scoreboard players operation var_active_mod_four sleep_calc %= var_by_four sleep_calc
execute if score var_overworld_active sleep_calc matches 10.. if score var_active_mod_four sleep_calc = var_mod_two sleep_calc run scoreboard players add var_sleepers_needed sleep_calc 1

# Ensure at least one sleeper when someone active is online.
execute if score var_overworld_active sleep_calc matches 1.. if score var_sleepers_needed sleep_calc matches ..0 run scoreboard players set var_sleepers_needed sleep_calc 1

# sleep_percent = floor((sleepers_needed * 100) / overworld_total)
# This is intentional: vanilla internally uses ceil(percentage * players / 100),
# so floor here avoids requesting one extra sleeper.
execute if score var_overworld_total sleep_calc matches 1.. run scoreboard players operation var_sleepers_scaled sleep_calc = var_sleepers_needed sleep_calc
execute if score var_overworld_total sleep_calc matches 1.. run scoreboard players operation var_sleepers_scaled sleep_calc *= var_percent_base sleep_calc
execute if score var_overworld_total sleep_calc matches 1.. run scoreboard players operation var_sleep_percent sleep_calc = var_sleepers_scaled sleep_calc
execute if score var_overworld_total sleep_calc matches 1.. run scoreboard players operation var_sleep_percent sleep_calc /= var_overworld_total sleep_calc

# If nobody is in Overworld, keep full requirement.
execute if score var_overworld_total sleep_calc matches ..0 run scoreboard players set var_sleep_percent sleep_calc 100

# Clamp to gamerule limits.
execute if score var_sleep_percent sleep_calc matches ..0 run scoreboard players set var_sleep_percent sleep_calc 1
execute if score var_sleep_percent sleep_calc matches 101.. run scoreboard players set var_sleep_percent sleep_calc 100

execute store result storage qol:sleep value int 1 run scoreboard players get var_sleep_percent sleep_calc
function qol:sleep/apply_macro with storage qol:sleep
