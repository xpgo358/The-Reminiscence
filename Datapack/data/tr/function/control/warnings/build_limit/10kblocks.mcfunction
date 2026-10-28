execute as @a[x=10000, dx=5000, y=-64, dy=1000, z=-15000, dz=30000] run function tr:control/warnings/build_limit/display_warning

execute as @a[x=-15000, dx=30000, y=-64, dy=1000, z=10000, dz=5000] run function tr:control/warnings/build_limit/display_warning

execute as @a[x=15000, dx=-30000, y=-64, dy=1000, z=10000, dz=5000] run function tr:control/warnings/build_limit/display_warning

execute as @a[x=-10000, dx=-5000, y=-64, dy=1000, z=15000, dz=-30000] run function tr:control/warnings/build_limit/display_warning
execute as @a[scores={10kwarning=1..}] run scoreboard players remove @s 10kwarning 1