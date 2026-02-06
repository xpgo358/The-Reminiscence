# Clear previous team memberships
team leave @a

# Assign players to the correct team based on their scoreboard values
execute as @a[scores={prank=0,recording=0,streaming=0}] run team join t_p0_r0_s0 @s
execute as @a[scores={prank=0,recording=1,streaming=0}] run team join t_p0_r1_s0 @s
execute as @a[scores={prank=0,recording=0,streaming=1}] run team join t_p0_r0_s1 @s
execute as @a[scores={prank=0,recording=1,streaming=1}] run team join t_p0_r1_s1 @s

execute as @a[scores={prank=1,recording=0,streaming=0}] run team join t_p1_r0_s0 @s
execute as @a[scores={prank=1,recording=1,streaming=0}] run team join t_p1_r1_s0 @s
execute as @a[scores={prank=1,recording=0,streaming=1}] run team join t_p1_r0_s1 @s
execute as @a[scores={prank=1,recording=1,streaming=1}] run team join t_p1_r1_s1 @s

execute as @a[scores={prank=2,recording=0,streaming=0}] run team join t_p2_r0_s0 @s
execute as @a[scores={prank=2,recording=1,streaming=0}] run team join t_p2_r1_s0 @s
execute as @a[scores={prank=2,recording=0,streaming=1}] run team join t_p2_r0_s1 @s
execute as @a[scores={prank=2,recording=1,streaming=1}] run team join t_p2_r1_s1 @s

execute as @a[scores={prank=3,recording=0,streaming=0}] run team join t_p3_r0_s0 @s
execute as @a[scores={prank=3,recording=1,streaming=0}] run team join t_p3_r1_s0 @s
execute as @a[scores={prank=3,recording=0,streaming=1}] run team join t_p3_r0_s1 @s
execute as @a[scores={prank=3,recording=1,streaming=1}] run team join t_p3_r1_s1 @s

execute as @a[scores={prank=4,recording=0,streaming=0}] run team join t_p4_r0_s0 @s
execute as @a[scores={prank=4,recording=1,streaming=0}] run team join t_p4_r1_s0 @s
execute as @a[scores={prank=4,recording=0,streaming=1}] run team join t_p4_r0_s1 @s
execute as @a[scores={prank=4,recording=1,streaming=1}] run team join t_p4_r1_s1 @s

execute as @a[scores={prank=5,recording=0,streaming=0}] run team join t_p5_r0_s0 @s
execute as @a[scores={prank=5,recording=1,streaming=0}] run team join t_p5_r1_s0 @s
execute as @a[scores={prank=5,recording=0,streaming=1}] run team join t_p5_r0_s1 @s
execute as @a[scores={prank=5,recording=1,streaming=1}] run team join t_p5_r1_s1 @s
