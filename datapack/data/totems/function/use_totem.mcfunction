# ===== ADDY JANN =====
# Detectar si el jugador tiene el tótem de Jann en la mano principal
execute as @a if items entity @s weapon.mainhand minecraft:totem_of_undying[item_model="addy_jann"] run scoreboard players set @s used_jann 3
# Detectar si el jugador tiene el tótem de Jann en la mano secundaria
execute as @a if items entity @s weapon.offhand minecraft:totem_of_undying[item_model="addy_jann"] run scoreboard players set @s used_jann 3
# Reducir el contador del tótem cada tick
execute as @a if score @s used_jann matches 1.. run scoreboard players remove @s used_jann 1
# Mostrar mensaje cuando se usa el tótem de Jann
execute as @a[scores={used_totem=1,used_jann=1..}] run tellraw @a [{"text":"¡Jann y ",color:"yellow"},{"selector":"@s",color:"gold",bold:true},{text:" se han ido a mimir!",color:"yellow"}]

# ===== ADIAC MANCHAS =====
# Detectar si el jugador tiene el tótem de Manchas en la mano principal
execute as @a if items entity @s weapon.mainhand minecraft:totem_of_undying[item_model="adiac_manchas"] run scoreboard players set @s used_manchas 3
# Detectar si el jugador tiene el tótem de Manchas en la mano secundaria
execute as @a if items entity @s weapon.offhand minecraft:totem_of_undying[item_model="adiac_manchas"] run scoreboard players set @s used_manchas 3
# Reducir el contador del tótem cada tick
execute as @a if score @s used_manchas matches 1.. run scoreboard players remove @s used_manchas 1
# Mostrar mensaje cuando se usa el tótem de Manchas
execute as @a[scores={used_totem=1,used_manchas=1..}] run tellraw @a [{"text":"¡Manchas no puede permitir que  ",color:"yellow"},{"selector":"@s",color:"gold",bold:true},{text:" no le siga malcriando y lo ha salvado!",color:"yellow"}]

# ===== BELBIO KIKI =====
# Detectar si el jugador tiene el tótem de Kiki en la mano principal
execute as @a if items entity @s weapon.mainhand minecraft:totem_of_undying[item_model="belbio_kiki"] run scoreboard players set @s used_kiki 3
# Detectar si el jugador tiene el tótem de Kiki en la mano secundaria
execute as @a if items entity @s weapon.offhand minecraft:totem_of_undying[item_model="belbio_kiki"] run scoreboard players set @s used_kiki 3
# Reducir el contador del tótem cada tick
execute as @a if score @s used_kiki matches 1.. run scoreboard players remove @s used_kiki 1
# Mostrar mensaje cuando se usa el tótem de Kiki
execute as @a[scores={used_totem=1,used_kiki=1..}] run tellraw @a [{"text":"¡Kiki ha empalado la muerte y a ",color:"yellow"},{"selector":"@s",color:"gold",bold:true},{text:" le gustaría darle un abrazo, pero pincha mucho!",color:"yellow"}]

# ===== BOOM TNT =====
# Detectar si el jugador tiene el tótem de TNT en la mano principal
execute as @a if items entity @s weapon.mainhand minecraft:totem_of_undying[item_model="boom_tnt"] run scoreboard players set @s used_tnt 3
# Detectar si el jugador tiene el tótem de TNT en la mano secundaria
execute as @a if items entity @s weapon.offhand minecraft:totem_of_undying[item_model="boom_tnt"] run scoreboard players set @s used_tnt 3
# Reducir el contador del tótem cada tick
execute as @a if score @s used_tnt matches 1.. run scoreboard players remove @s used_tnt 1
# Mostrar mensaje cuando se usa el tótem de TNT
execute as @a[scores={used_totem=1,used_tnt=1..}] run tellraw @a [{"selector":"@s",color:"gold",bold:true},{text:" se salvó de la muerte gracias a TNT!",color:"yellow","bold":false}]

# ===== CLUC MIXU =====
# Detectar si el jugador tiene el tótem de Mixu en la mano principal
execute as @a if items entity @s weapon.mainhand minecraft:totem_of_undying[item_model="cluc_mixu"] run scoreboard players set @s used_mixu 3
# Detectar si el jugador tiene el tótem de Mixu en la mano secundaria
execute as @a if items entity @s weapon.offhand minecraft:totem_of_undying[item_model="cluc_mixu"] run scoreboard players set @s used_mixu 3
# Reducir el contador del tótem cada tick
execute as @a if score @s used_mixu matches 1.. run scoreboard players remove @s used_mixu 1
# Mostrar mensaje cuando se usa el tótem de Mixu
execute as @a[scores={used_totem=1,used_mixu=1..}] run tellraw @a [{"text":"¡Mixu ha decidido que ",color:"yellow"},{"selector":"@s",color:"gold",bold:true},{text:" le importa y le ha salvado!",color:"yellow"}]

# ===== CRISHO OLD TOTEM =====
# Detectar si el jugador tiene el tótem antiguo en la mano principal
execute as @a if items entity @s weapon.mainhand minecraft:totem_of_undying[item_model="crisho_totem"] run scoreboard players set @s used_oldtotem 3
# Detectar si el jugador tiene el tótem antiguo en la mano secundaria
execute as @a if items entity @s weapon.offhand minecraft:totem_of_undying[item_model="crisho_totem"] run scoreboard players set @s used_oldtotem 3
# Reducir el contador del tótem cada tick
execute as @a if score @s used_oldtotem matches 1.. run scoreboard players remove @s used_oldtotem 1
# Mostrar mensaje cuando se usa el tótem antiguo
execute as @a[scores={used_totem=1,used_oldtotem=1..}] run tellraw @a [{"text":"¡Tanta nostalgia le ha dado una segunda vida a ",color:"yellow"},{"selector":"@s",color:"gold",bold:true},{text:" !",color:"yellow"}]

# ===== DALOX AZALEA =====
# Detectar si el jugador tiene el tótem de Azalea en la mano principal
execute as @a if items entity @s weapon.mainhand minecraft:totem_of_undying[item_model="dalox_azalea"] run scoreboard players set @s used_azalea 3
# Detectar si el jugador tiene el tótem de Azalea en la mano secundaria
execute as @a if items entity @s weapon.offhand minecraft:totem_of_undying[item_model="dalox_azalea"] run scoreboard players set @s used_azalea 3
# Reducir el contador del tótem cada tick
execute as @a if score @s used_azalea matches 1.. run scoreboard players remove @s used_azalea 1
# Mostrar mensaje cuando se usa el tótem de Azalea
execute as @a[scores={used_totem=1,used_azalea=1..}] run tellraw @a [{"text":"¡La azalea ha enamorado a ","color":"yellow"},{"selector":"@s","color":"gold","bold":true},{text:" salvándole de la muerte!","color":"yellow"}]

# ===== ERNESTO FIONA =====
# Detectar si el jugador tiene el tótem de Fiona en la mano principal
execute as @a if items entity @s weapon.mainhand minecraft:totem_of_undying[item_model="ernesto_fiona"] run scoreboard players set @s used_fiona 3
# Detectar si el jugador tiene el tótem de Fiona en la mano secundaria
execute as @a if items entity @s weapon.offhand minecraft:totem_of_undying[item_model="ernesto_fiona"] run scoreboard players set @s used_fiona 3
# Reducir el contador del tótem cada tick
execute as @a if score @s used_fiona matches 1.. run scoreboard players remove @s used_fiona 1
# Mostrar mensaje cuando se usa el tótem de Fiona
execute as @a[scores={used_totem=1,used_fiona=1..}] run tellraw @a [{"text":"¡Fiona ha aplastado la muerte salvando a ",color:"yellow"},{"selector":"@s",color:"gold",bold:true},{text:" de una muerte segura!",color:"yellow"}]

# ===== ESTELA STAR =====
# Detectar si el jugador tiene el tótem de Star en la mano principal
execute as @a if items entity @s weapon.mainhand minecraft:totem_of_undying[item_model="estela_star"] run scoreboard players set @s used_star 3
# Detectar si el jugador tiene el tótem de Star en la mano secundaria
execute as @a if items entity @s weapon.offhand minecraft:totem_of_undying[item_model="estela_star"] run scoreboard players set @s used_star 3
# Reducir el contador del tótem cada tick
execute as @a if score @s used_star matches 1.. run scoreboard players remove @s used_star 1
# Mostrar mensaje cuando se usa el tótem de Star
execute as @a[scores={used_totem=1,used_star=1..}] run tellraw @a [{"text":"¡El deseo de ",color:"yellow"},{"selector":"@s",color:"gold",bold:true},{text:" se ha cumplido, dándole una segunda oportunidad!",color:"yellow"}]

# ===== ISMA FAIL =====
# Detectar si el jugador tiene el tótem de Fail en la mano principal
execute as @a if items entity @s weapon.mainhand minecraft:totem_of_undying[item_model="isma_fail"] run scoreboard players set @s used_fail 3
# Detectar si el jugador tiene el tótem de Fail en la mano secundaria
execute as @a if items entity @s weapon.offhand minecraft:totem_of_undying[item_model="isma_fail"] run scoreboard players set @s used_fail 3
# Reducir el contador del tótem cada tick
execute as @a if score @s used_fail matches 1.. run scoreboard players remove @s used_fail 1
# Mostrar mensaje cuando se usa el tótem de Fail
execute as @a[scores={used_totem=1,used_fail=1..}] run tellraw @a [{"text":"¡",color:"yellow"},{"selector":"@s",color:"gold",bold:true},{text:" rolled a Critical Fail!",color:"yellow"}]

# ===== JOLYNE LASER =====
# Detectar si el jugador tiene el tótem de Laser en la mano principal
execute as @a if items entity @s weapon.mainhand minecraft:totem_of_undying[item_model="jolyne_laser"] run scoreboard players set @s used_laser 3
# Detectar si el jugador tiene el tótem de Laser en la mano secundaria
execute as @a if items entity @s weapon.offhand minecraft:totem_of_undying[item_model="jolyne_laser"] run scoreboard players set @s used_laser 3
# Reducir el contador del tótem cada tick
execute as @a if score @s used_laser matches 1.. run scoreboard players remove @s used_laser 1
# Mostrar mensaje cuando se usa el tótem de Laser
execute as @a[scores={used_totem=1,used_laser=1..}] run tellraw @a [{"text":"¡Láser le ha lanzado ¿láseres? a la muerte y ",color:"yellow"},{"selector":"@s",color:"gold",bold:true},{text:" está muy orgullos@ de su pequeño Superman!",color:"yellow"}]

# ===== KAREN THOR =====
# Detectar si el jugador tiene el tótem de Thor en la mano principal
execute as @a if items entity @s weapon.mainhand minecraft:totem_of_undying[item_model="karen_thor"] run scoreboard players set @s used_thor 3
# Detectar si el jugador tiene el tótem de Thor en la mano secundaria
execute as @a if items entity @s weapon.offhand minecraft:totem_of_undying[item_model="karen_thor"] run scoreboard players set @s used_thor 3
# Reducir el contador del tótem cada tick
execute as @a if score @s used_thor matches 1.. run scoreboard players remove @s used_thor 1
# Mostrar mensaje cuando se usa el tótem de Thor
execute as @a[scores={used_totem=1,used_thor=1..}] run tellraw @a [{"text":"¡Thor le ha metido un martillazo en la cabeza a la muerte y ha salvado a ",color:"yellow"},{"selector":"@s",color:"gold",bold:true},{text:" de volverse un poco Loki!",color:"yellow"}]

# ===== LU LALA =====
# Detectar si el jugador tiene el tótem de Lala en la mano principal
execute as @a if items entity @s weapon.mainhand minecraft:totem_of_undying[item_model="lu_lala"] run scoreboard players set @s used_lala 3
# Detectar si el jugador tiene el tótem de Lala en la mano secundaria
execute as @a if items entity @s weapon.offhand minecraft:totem_of_undying[item_model="lu_lala"] run scoreboard players set @s used_lala 3
# Reducir el contador del tótem cada tick
execute as @a if score @s used_lala matches 1.. run scoreboard players remove @s used_lala 1
# Mostrar mensaje cuando se usa el tótem de Lala
execute as @a[scores={used_totem=1,used_lala=1..}] run tellraw @a [{"text":"¡Lala ha repartido amor y ha devuelto a ",color:"yellow"},{"selector":"@s",color:"gold",bold:true},{text:" al combate!",color:"yellow"}]

# ===== MATI YUKI =====
# Detectar si el jugador tiene el tótem de Yuki en la mano principal
execute as @a if items entity @s weapon.mainhand minecraft:totem_of_undying[item_model="mati_yuki"] run scoreboard players set @s used_yuki 3
# Detectar si el jugador tiene el tótem de Yuki en la mano secundaria
execute as @a if items entity @s weapon.offhand minecraft:totem_of_undying[item_model="mati_yuki"] run scoreboard players set @s used_yuki 3
# Reducir el contador del tótem cada tick
execute as @a if score @s used_yuki matches 1.. run scoreboard players remove @s used_yuki 1
# Mostrar mensaje cuando se usa el tótem de Yuki
execute as @a[scores={used_totem=1,used_yuki=1..}] run tellraw @a [{"text":"¡Yuki ha ronroneado, provocando tanta ternura a ",color:"yellow"},{"selector":"@s",color:"gold",bold:true},{text:" que le ha curado!",color:"yellow"}]

# ===== MELKLYTH ESCARCHITA =====
# Detectar si el jugador tiene el tótem de Escarchita en la mano principal
execute as @a if items entity @s weapon.mainhand minecraft:totem_of_undying[item_model="melklyth_escarchita"] run scoreboard players set @s used_escarchita 3
# Detectar si el jugador tiene el tótem de Escarchita en la mano secundaria
execute as @a if items entity @s weapon.offhand minecraft:totem_of_undying[item_model="melklyth_escarchita"] run scoreboard players set @s used_escarchita 3
# Reducir el contador del tótem cada tick
execute as @a if score @s used_escarchita matches 1.. run scoreboard players remove @s used_escarchita 1
# Mostrar mensaje cuando se usa el tótem de Escarchita
execute as @a[scores={used_totem=1,used_escarchita=1..}] run tellraw @a [{"text":"¡Escarchita ha helado la muerte con su pelaje convirtiendo en un polo a ",color:"yellow"},{"selector":"@s",color:"gold",bold:true},{text:" en el proceso!",color:"yellow"}]

# ===== NEBLUNO NERI =====
# Detectar si el jugador tiene el tótem de Neri en la mano principal
execute as @a if items entity @s weapon.mainhand minecraft:totem_of_undying[item_model="nebluno_neri"] run scoreboard players set @s used_neri 3
# Detectar si el jugador tiene el tótem de Neri en la mano secundaria
execute as @a if items entity @s weapon.offhand minecraft:totem_of_undying[item_model="nebluno_neri"] run scoreboard players set @s used_neri 3
# Reducir el contador del tótem cada tick
execute as @a if score @s used_neri matches 1.. run scoreboard players remove @s used_neri 1
# Mostrar mensaje cuando se usa el tótem de Neri
execute as @a[scores={used_totem=1,used_neri=1..}] run tellraw @a [{"text":"¡Neri ha salido volando junto a ",color:"yellow"},{"selector":"@s",color:"gold",bold:true},{text:" escabulléndose de la muerte!",color:"yellow"}]

# ===== PAMME RICH =====
# Detectar si el jugador tiene el tótem de Rich en la mano principal
execute as @a if items entity @s weapon.mainhand minecraft:totem_of_undying[item_model="pamme_rich"] run scoreboard players set @s used_rich 3
# Detectar si el jugador tiene el tótem de Rich en la mano secundaria
execute as @a if items entity @s weapon.offhand minecraft:totem_of_undying[item_model="pamme_rich"] run scoreboard players set @s used_rich 3
# Reducir el contador del tótem cada tick
execute as @a if score @s used_rich matches 1.. run scoreboard players remove @s used_rich 1
# Mostrar mensaje cuando se usa el tótem de Rich
execute as @a[scores={used_totem=1,used_rich=1..}] run tellraw @a [{"text":"¡Rich le ha donado la poca cordura que le queda a ",color:"yellow"},{"selector":"@s",color:"gold",bold:true},{text:" evitando la demencia!",color:"yellow"}]

# ===== PHAVERN RALSEI =====
# Detectar si el jugador tiene el tótem de Ralsei en la mano principal
execute as @a if items entity @s weapon.mainhand minecraft:totem_of_undying[item_model="phavern_ralsei"] run scoreboard players set @s used_ralsei 3
# Detectar si el jugador tiene el tótem de Ralsei en la mano secundaria
execute as @a if items entity @s weapon.offhand minecraft:totem_of_undying[item_model="phavern_ralsei"] run scoreboard players set @s used_ralsei 3
# Reducir el contador del tótem cada tick
execute as @a if score @s used_ralsei matches 1.. run scoreboard players remove @s used_ralsei 1
# Mostrar mensaje cuando se usa el tótem de Ralsei
execute as @a[scores={used_totem=1,used_ralsei=1..}] run tellraw @a [{"text":"¡Ralsei le ha hecho un pastel a ",color:"yellow"},{"selector":"@s",color:"gold",bold:true},{text:" y le ha dado una segunda vida!",color:"yellow"}]

# ===== PHOS DANNY =====
# Detectar si el jugador tiene el tótem de Danny en la mano principal
execute as @a if items entity @s weapon.mainhand minecraft:totem_of_undying[item_model="phos_danny"] run scoreboard players set @s used_danny 3
# Detectar si el jugador tiene el tótem de Danny en la mano secundaria
execute as @a if items entity @s weapon.offhand minecraft:totem_of_undying[item_model="phos_danny"] run scoreboard players set @s used_danny 3
# Reducir el contador del tótem cada tick
execute as @a if score @s used_danny matches 1.. run scoreboard players remove @s used_danny 1
# Mostrar mensaje cuando se usa el tótem de Danny
execute as @a[scores={used_totem=1,used_danny=1..}] run tellraw @a [{"text":"¡No es Garfield, es Danny, que ha salvado a  ",color:"yellow"},{"selector":"@s",color:"gold",bold:true},{text:" comiéndose la muerte de un bocado!",color:"yellow"}]

# ===== SAMA MIKA =====
# Detectar si el jugador tiene el tótem de Mika en la mano principal
execute as @a if items entity @s weapon.mainhand minecraft:totem_of_undying[item_model="sama_mika"] run scoreboard players set @s used_mika 3
# Detectar si el jugador tiene el tótem de Mika en la mano secundaria
execute as @a if items entity @s weapon.offhand minecraft:totem_of_undying[item_model="sama_mika"] run scoreboard players set @s used_mika 3
# Reducir el contador del tótem cada tick
execute as @a if score @s used_mika matches 1.. run scoreboard players remove @s used_mika 1
# Mostrar mensaje cuando se usa el tótem de Mika
execute as @a[scores={used_totem=1,used_mika=1..}] run tellraw @a [{"text":"¡Mika le ha dado tanta ternura a la muerte que ha decidido dejar con vida a ",color:"yellow"},{"selector":"@s",color:"gold",bold:true},{text:"!",color:"yellow"}]

# ===== SOPHIA LUNA =====
# Detectar si el jugador tiene el tótem de Luna en la mano principal
execute as @a if items entity @s weapon.mainhand minecraft:totem_of_undying[item_model="sophia_luna"] run scoreboard players set @s used_luna 3
# Detectar si el jugador tiene el tótem de Luna en la mano secundaria
execute as @a if items entity @s weapon.offhand minecraft:totem_of_undying[item_model="sophia_luna"] run scoreboard players set @s used_luna 3
# Reducir el contador del tótem cada tick
execute as @a if score @s used_luna matches 1.. run scoreboard players remove @s used_luna 1
# Mostrar mensaje cuando se usa el tótem de Luna
execute as @a[scores={used_totem=1,used_luna=1..}] run tellraw @a [{"text":"¡Luna ha salvado a ",color:"yellow"},{"selector":"@s",color:"gold",bold:true},{text:" de manera épica!",color:"yellow"}]

# ===== UMIEMPI PATITAS =====
# Detectar si el jugador tiene el tótem de Patitas en la mano principal
execute as @a if items entity @s weapon.mainhand minecraft:totem_of_undying[item_model="umiempi_patitas"] run scoreboard players set @s used_patitas 3
# Detectar si el jugador tiene el tótem de Patitas en la mano secundaria
execute as @a if items entity @s weapon.offhand minecraft:totem_of_undying[item_model="umiempi_patitas"] run scoreboard players set @s used_patitas 3
# Reducir el contador del tótem cada tick
execute as @a if score @s used_patitas matches 1.. run scoreboard players remove @s used_patitas 1
# Mostrar mensaje cuando se usa el tótem de Patitas
execute as @a[scores={used_totem=1,used_patitas=1..}] run tellraw @a [{"text":"¡Patitas le ha dado un masaje a ",color:"yellow"},{"selector":"@s",color:"gold",bold:true},{text:" con sus patitas!",color:"yellow"}]

# ===== VAYNILO FELIPE =====
# Detectar si el jugador tiene el tótem de Felipe en la mano principal
execute as @a if items entity @s weapon.mainhand minecraft:totem_of_undying[item_model="vaynilo_felipe"] run scoreboard players set @s used_felipe 3
# Detectar si el jugador tiene el tótem de Felipe en la mano secundaria
execute as @a if items entity @s weapon.offhand minecraft:totem_of_undying[item_model="vaynilo_felipe"] run scoreboard players set @s used_felipe 3
# Reducir el contador del tótem cada tick
execute as @a if score @s used_felipe matches 1.. run scoreboard players remove @s used_felipe 1
# Mostrar mensaje cuando se usa el tótem de Felipe
execute as @a[scores={used_totem=1,used_felipe=1..}] run tellraw @a [{"text":"¡Felipe ha roído la muerte hasta el último hueso salvando a ",color:"yellow"},{"selector":"@s",color:"gold",bold:true},{text:"!",color:"yellow"}]

# ===== VORTI HDS =====
# Detectar si el jugador tiene el tótem de HDS en la mano principal
execute as @a if items entity @s weapon.mainhand minecraft:totem_of_undying[item_model="vorti_hds"] run scoreboard players set @s used_hds 3
# Detectar si el jugador tiene el tótem de HDS en la mano secundaria
execute as @a if items entity @s weapon.offhand minecraft:totem_of_undying[item_model="vorti_hds"] run scoreboard players set @s used_hds 3
# Reducir el contador del tótem cada tick
execute as @a if score @s used_hds matches 1.. run scoreboard players remove @s used_hds 1
# Mostrar mensaje cuando se usa el tótem de HDS
execute as @a[scores={used_totem=1,used_hds=1..}] run tellraw @a [{"text":"¡",color:"yellow"},{"selector":"@s",color:"gold",bold:true},{text:" ha vuelto a empezar el ciclo!",color:"yellow"}]

# ===== WHIISWIM DUNYA =====
# Detectar si el jugador tiene el tótem de Dunya en la mano principal
execute as @a if items entity @s weapon.mainhand minecraft:totem_of_undying[item_model="whiiswim_dunya"] run scoreboard players set @s used_dunya 3
# Detectar si el jugador tiene el tótem de Dunya en la mano secundaria
execute as @a if items entity @s weapon.offhand minecraft:totem_of_undying[item_model="whiiswim_dunya"] run scoreboard players set @s used_dunya 3
# Reducir el contador del tótem cada tick
execute as @a if score @s used_dunya matches 1.. run scoreboard players remove @s used_dunya 1
# Mostrar mensaje cuando se usa el tótem de Dunya
execute as @a[scores={used_totem=1,used_dunya=1..}] run tellraw @a [{"text":"¡Dünya ha mostrado tanta indiferencia que ",color:"yellow"},{"selector":"@s",color:"gold",bold:true},{text:" aburrido, se ha curado a si mismo!",color:"yellow"}]

# ===== WILLY LANCER =====
# Detectar si el jugador tiene el tótem de Lancer en la mano principal
execute as @a if items entity @s weapon.mainhand minecraft:totem_of_undying[item_model="willy_lancer"] run scoreboard players set @s used_lancer 3
# Detectar si el jugador tiene el tótem de Lancer en la mano secundaria
execute as @a if items entity @s weapon.offhand minecraft:totem_of_undying[item_model="willy_lancer"] run scoreboard players set @s used_lancer 3
# Reducir el contador del tótem cada tick
execute as @a if score @s used_lancer matches 1.. run scoreboard players remove @s used_lancer 1
# Mostrar mensaje cuando se usa el tótem de Lancer
execute as @a[scores={used_totem=1,used_lancer=1..}] run tellraw @a [{"text":"¡Lancer es TAN malo que la muerte ha huido y se ha olvidado de ",color:"yellow"},{"selector":"@s",color:"gold",bold:true},{"text":"!",color:"yellow"}]

# ===== XP BAKU =====
# Detectar si el jugador tiene el tótem de Baku en la mano principal
execute as @a if items entity @s weapon.mainhand minecraft:totem_of_undying[item_model="xp_baku"] run scoreboard players set @s used_baku 3
# Detectar si el jugador tiene el tótem de Baku en la mano secundaria
execute as @a if items entity @s weapon.offhand minecraft:totem_of_undying[item_model="xp_baku"] run scoreboard players set @s used_baku 3
# Reducir el contador del tótem cada tick
execute as @a if score @s used_baku matches 1.. run scoreboard players remove @s used_baku 1
# Mostrar mensaje cuando se usa el tótem de Baku
execute as @a[scores={used_totem=1,used_baku=1..}] run tellraw @a [{"text":"¡Baku se ha quedado dormido en las piernas de ",color:"yellow"},{"selector":"@s",color:"gold",bold:true},{text:", evitando su muerte!",color:"yellow"}]

# ===== ZER BULLET =====
# Detectar si el jugador tiene el tótem de Bullet en la mano principal
execute as @a if items entity @s weapon.mainhand minecraft:totem_of_undying[item_model="zer_bullet"] run scoreboard players set @s used_bullet 3
# Detectar si el jugador tiene el tótem de Bullet en la mano secundaria
execute as @a if items entity @s weapon.offhand minecraft:totem_of_undying[item_model="zer_bullet"] run scoreboard players set @s used_bullet 3
# Reducir el contador del tótem cada tick
execute as @a if score @s used_bullet matches 1.. run scoreboard players remove @s used_bullet 1
# Mostrar mensaje cuando se usa el tótem de Bullet
execute as @a[scores={used_totem=1,used_bullet=1..}] run tellraw @a [{"text":"¡",color:"yellow"},{"selector":"@s",color:"gold",bold:true},{text:" le ha disparado a la muerte con su balín, librándose de ella!",color:"yellow"}]

# ===== RESET =====
# Resetear el marcador de uso de tótem para el siguiente uso
execute as @a[scores={used_totem=1}] run scoreboard players set @s used_totem 0