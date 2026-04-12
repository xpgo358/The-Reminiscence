## Clear previous team memberships
team leave @a

## Assign players to the correct team based on their scoreboard values

# AFK
execute as @a[scores={afk-status=1}] at @s if dimension minecraft:overworld run team join AFK_OVERWORLD @s
execute as @a[scores={afk-status=1}] at @s if dimension minecraft:the_nether run team join AFK_NETHER @s
execute as @a[scores={afk-status=1}] at @s if dimension minecraft:the_end run team join AFK_END @s

# Prank 0
execute as @a[scores={afk-status=0,prank-level=0,recording-status=0,streaming-status=0}] run team join t_p0_r0_s0 @s
execute as @a[scores={afk-status=0,prank-level=0,recording-status=1,streaming-status=0}] run team join t_p0_r1_s0 @s
execute as @a[scores={afk-status=0,prank-level=0,recording-status=0,streaming-status=1}] run team join t_p0_r0_s1 @s
execute as @a[scores={afk-status=0,prank-level=0,recording-status=1,streaming-status=1}] run team join t_p0_r1_s1 @s

# Prank 1
execute as @a[scores={afk-status=0,prank-level=1,recording-status=0,streaming-status=0}] run team join t_p1_r0_s0 @s
execute as @a[scores={afk-status=0,prank-level=1,recording-status=1,streaming-status=0}] run team join t_p1_r1_s0 @s
execute as @a[scores={afk-status=0,prank-level=1,recording-status=0,streaming-status=1}] run team join t_p1_r0_s1 @s
execute as @a[scores={afk-status=0,prank-level=1,recording-status=1,streaming-status=1}] run team join t_p1_r1_s1 @s

# Prank 2
execute as @a[scores={afk-status=0,prank-level=2,recording-status=0,streaming-status=0}] run team join t_p2_r0_s0 @s
execute as @a[scores={afk-status=0,prank-level=2,recording-status=1,streaming-status=0}] run team join t_p2_r1_s0 @s
execute as @a[scores={afk-status=0,prank-level=2,recording-status=0,streaming-status=1}] run team join t_p2_r0_s1 @s
execute as @a[scores={afk-status=0,prank-level=2,recording-status=1,streaming-status=1}] run team join t_p2_r1_s1 @s

# Prank 3
execute as @a[scores={afk-status=0,prank-level=3,recording-status=0,streaming-status=0}] run team join t_p3_r0_s0 @s
execute as @a[scores={afk-status=0,prank-level=3,recording-status=1,streaming-status=0}] run team join t_p3_r1_s0 @s
execute as @a[scores={afk-status=0,prank-level=3,recording-status=0,streaming-status=1}] run team join t_p3_r0_s1 @s
execute as @a[scores={afk-status=0,prank-level=3,recording-status=1,streaming-status=1}] run team join t_p3_r1_s1 @s

# Prank 4
execute as @a[scores={afk-status=0,prank-level=4,recording-status=0,streaming-status=0}] run team join t_p4_r0_s0 @s
execute as @a[scores={afk-status=0,prank-level=4,recording-status=1,streaming-status=0}] run team join t_p4_r1_s0 @s
execute as @a[scores={afk-status=0,prank-level=4,recording-status=0,streaming-status=1}] run team join t_p4_r0_s1 @s
execute as @a[scores={afk-status=0,prank-level=4,recording-status=1,streaming-status=1}] run team join t_p4_r1_s1 @s

# Prank 5
execute as @a[scores={afk-status=0,prank-level=5,recording-status=0,streaming-status=0}] run team join t_p5_r0_s0 @s
execute as @a[scores={afk-status=0,prank-level=5,recording-status=1,streaming-status=0}] run team join t_p5_r1_s0 @s
execute as @a[scores={afk-status=0,prank-level=5,recording-status=0,streaming-status=1}] run team join t_p5_r0_s1 @s
execute as @a[scores={afk-status=0,prank-level=5,recording-status=1,streaming-status=1}] run team join t_p5_r1_s1 @s
