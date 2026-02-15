tellraw @a {"text":"[tr] Clearing teams...","color":"yellow"}

## Remove all teams related to the prank system, recording and streaming

# Prank 0
team remove t_p0_r0_s0
team remove t_p0_r1_s0
team remove t_p0_r0_s1
team remove t_p0_r1_s1

# Prank 1
team remove t_p1_r0_s0
team remove t_p1_r1_s0
team remove t_p1_r0_s1
team remove t_p1_r1_s1

# Prank 2
team remove t_p2_r0_s0
team remove t_p2_r1_s0
team remove t_p2_r0_s1
team remove t_p2_r1_s1

# Prank 3
team remove t_p3_r0_s0
team remove t_p3_r1_s0
team remove t_p3_r0_s1
team remove t_p3_r1_s1

# Prank 4
team remove t_p4_r0_s0
team remove t_p4_r1_s0
team remove t_p4_r0_s1
team remove t_p4_r1_s1

# Prank 5
team remove t_p5_r0_s0
team remove t_p5_r1_s0
team remove t_p5_r0_s1
team remove t_p5_r1_s1

## Clear any remaining team memberships
team leave @a

tellraw @a {"text":"[tr] Teams cleared","color":"green"}