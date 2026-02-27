#tellraw @a {"text":"[tr] Creando teams...","color":"yellow"}
## Create teams for all prank/recording/streaming status combinations

# AFK
team add AFK
team modify AFK color gray
team modify AFK suffix {"text":" ⌀","color":"gray", bold:true}

# Prank 0
team add t_p0_r0_s0
team modify t_p0_r0_s0 suffix {"text":" ⓪","color":"gray",bold:false}
team add t_p0_r1_s0
team modify t_p0_r1_s0 suffix {"text":"","extra":[{"text":" ⓪ ","color":"gray", bold:false},{"text":"●","color":"dark_red",bold:false}]}
team add t_p0_r0_s1
team modify t_p0_r0_s1 suffix {"text":"","extra":[{"text":" ⓪ ","color":"gray",bold:false},{"text":"●","color":"dark_purple",bold:false}]}
team add t_p0_r1_s1
team modify t_p0_r1_s1 suffix {"text":"","extra":[{"text":" ⓪ ","color":"gray",bold:false},{"text":"● ","color":"dark_red",bold:false},{"text":"●","color":"dark_purple",bold:false}]}

# Prank 1
team add t_p1_r0_s0
team modify t_p1_r0_s0 suffix {"text":" ①","color":"green",bold:false}
team add t_p1_r1_s0
team modify t_p1_r1_s0 suffix {"text":"","extra":[{"text":" ① ","color":"green",bold:false},{"text":"●","color":"dark_red",bold:false}]}
team add t_p1_r0_s1
team modify t_p1_r0_s1 suffix {"text":"","extra":[{"text":" ① ","color":"green",bold:false},{"text":"●","color":"dark_purple",bold:false}]}
team add t_p1_r1_s1
team modify t_p1_r1_s1 suffix {"text":"","extra":[{"text":" ① ","color":"green",bold:false},{"text":"● ","color":"dark_red",bold:false},{"text":"●","color":"dark_purple",bold:false}]}

# Prank 2
team add t_p2_r0_s0
team modify t_p2_r0_s0 suffix {"text":" ②","color":"yellow",bold:false}
team add t_p2_r1_s0
team modify t_p2_r1_s0 suffix {"text":"","extra":[{"text":" ② ","color":"yellow",bold:false},{"text":"●","color":"dark_red",bold:false}]}
team add t_p2_r0_s1
team modify t_p2_r0_s1 suffix {"text":"","extra":[{"text":" ② ","color":"yellow",bold:false},{"text":"●","color":"dark_purple",bold:false}]}
team add t_p2_r1_s1
team modify t_p2_r1_s1 suffix {"text":"","extra":[{"text":" ② ","color":"yellow",bold:false},{"text":"● ","color":"dark_red",bold:false},{"text":"●","color":"dark_purple",bold:false}]}

# Prank 3
team add t_p3_r0_s0
team modify t_p3_r0_s0 suffix {"text":" ③","color":"gold",bold:false}
team add t_p3_r1_s0
team modify t_p3_r1_s0 suffix {"text":"","extra":[{"text":" ③ ","color":"gold",bold:false},{"text":"●","color":"dark_red",bold:false}]}
team add t_p3_r0_s1
team modify t_p3_r0_s1 suffix {"text":"","extra":[{"text":" ③ ","color":"gold",bold:false},{"text":"●","color":"dark_purple",bold:false}]}
team add t_p3_r1_s1
team modify t_p3_r1_s1 suffix {"text":"","extra":[{"text":" ③ ","color":"gold",bold:false},{"text":"● ","color":"dark_red",bold:false},{"text":"●","color":"dark_purple",bold:false}]}

# Prank 4
team add t_p4_r0_s0
team modify t_p4_r0_s0 suffix {"text":" ④","color":"red",bold:false}
team add t_p4_r1_s0
team modify t_p4_r1_s0 suffix {"text":"","extra":[{"text":" ④ ","color":"red",bold:false},{"text":"●","color":"dark_red",bold:false}]}
team add t_p4_r0_s1
team modify t_p4_r0_s1 suffix {"text":"","extra":[{"text":" ④ ","color":"red",bold:false},{"text":"●","color":"dark_purple",bold:false}]}
team add t_p4_r1_s1
team modify t_p4_r1_s1 suffix {"text":"","extra":[{"text":" ④ ","color":"red",bold:false},{"text":"● ","color":"dark_red",bold:false},{"text":"●","color":"dark_purple",bold:false}]}

# Prank 5
team add t_p5_r0_s0
team modify t_p5_r0_s0 suffix {"text":" ⑤","color":"dark_red",bold:false}
team add t_p5_r1_s0
team modify t_p5_r1_s0 suffix {"text":"","extra":[{"text":" ⑤ ","color":"dark_red",bold:false},{"text":"●","color":"dark_red",bold:false}]}
team add t_p5_r0_s1
team modify t_p5_r0_s1 suffix {"text":"","extra":[{"text":" ⑤ ","color":"dark_red",bold:false},{"text":"●","color":"dark_purple",bold:false}]}
team add t_p5_r1_s1
team modify t_p5_r1_s1 suffix {"text":"","extra":[{"text":" ⑤ ","color":"dark_red",bold:false},{"text":"● ","color":"dark_red",bold:false},{"text":"●","color":"dark_purple",bold:false}]}

#tellraw @a {"text":"[tr] Teams creados","color":"green"}