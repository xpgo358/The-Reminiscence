#Detectar y cambiar el tótem del jugador al elegido
execute as @a[scores={felipe=-1}] if items entity @s weapon.mainhand minecraft:totem_of_undying run playsound block.note_block.bell master @s ~ ~ ~ 1000 0.1
execute as @a[scores={felipe=-1}] if items entity @s weapon.mainhand minecraft:totem_of_undying run item replace entity @s weapon.mainhand with totem_of_undying[item_name={"text":"Felipe"},item_model="vaynilo_felipe"]
execute as @a[scores={felipe=-1}] run scoreboard players set @s felipe 0
execute as @a[scores={used_totem=1,used_felipe=1..}] run tellraw @a [{"text":"¡Felipe ha roído la muerte hasta el último hueso salvando a ",color:"yellow"},{"selector":"@s",color:"gold",bold:true},{text:"!",color:"yellow"}]

execute as @a[scores={baku=-1}] if items entity @s weapon.mainhand minecraft:totem_of_undying run playsound block.note_block.bell master @s ~ ~ ~ 1000 0.2
execute as @a[scores={baku=-1}] if items entity @s weapon.mainhand minecraft:totem_of_undying run item replace entity @s weapon.mainhand with totem_of_undying[item_name={"text":"Baku"},item_model="xp_baku"]
execute as @a[scores={baku=-1}] run scoreboard players set @s baku 0
execute as @a[scores={used_totem=1,used_baku=1..}] run tellraw @a [{"text":"¡[placeholder] ",color:"yellow"},{"selector":"@s",color:"gold",bold:true},{text:" [placeholder]!",color:"yellow"}]


execute as @a[scores={tnt=-1}] if items entity @s weapon.mainhand minecraft:totem_of_undying run playsound block.note_block.bell master @s ~ ~ ~ 1000 0.3
execute as @a[scores={tnt=-1}] if items entity @s weapon.mainhand minecraft:totem_of_undying run item replace entity @s weapon.mainhand with totem_of_undying[item_name={"text":"TNT"},item_model="boom_tnt"]
execute as @a[scores={tnt=-1}] run scoreboard players set @s tnt 0
execute as @a[scores={used_totem=1,used_tnt=1..}] run tellraw @a [{"selector":"@s",color:"gold",bold:true},{text:" tnt'ed away from death!",color:"yellow","bold":false}]


execute as @a[scores={bullet=-1}] if items entity @s weapon.mainhand minecraft:totem_of_undying run playsound block.note_block.bell master @s ~ ~ ~ 1000 0.4
execute as @a[scores={bullet=-1}] if items entity @s weapon.mainhand minecraft:totem_of_undying run item replace entity @s weapon.mainhand with totem_of_undying[item_name={"text":"Balín"},item_model="zer_bullet"]
execute as @a[scores={bullet=-1}] run scoreboard players set @s bullet 0
execute as @a[scores={used_totem=1,used_bullet=1..}] run tellraw @a [{"text":"¡",color:"yellow"},{"selector":"@s",color:"gold",bold:true},{text:" le ha disparado a la muerte con su balín, librándose de ella!",color:"yellow"}]


execute as @a[scores={danny=-1}] if items entity @s weapon.mainhand minecraft:totem_of_undying run playsound block.note_block.bell master @s ~ ~ ~ 1000 0.5
execute as @a[scores={danny=-1}] if items entity @s weapon.mainhand minecraft:totem_of_undying run item replace entity @s weapon.mainhand with totem_of_undying[item_name={"text":"Danny"},item_model="phos_danny"]
execute as @a[scores={danny=-1}] run scoreboard players set @s danny 0
execute as @a[scores={used_totem=1,used_danny=1..}] run tellraw @a [{"text":"¡No es Garfield, es Danny, que ha salvado a  ",color:"yellow"},{"selector":"@s",color:"gold",bold:true},{text:" comiéndose la muerte de un bocado!",color:"yellow"}]


execute as @a[scores={escarchita=-1}] if items entity @s weapon.mainhand minecraft:totem_of_undying run playsound block.note_block.bell master @s ~ ~ ~ 1000 0.6
execute as @a[scores={escarchita=-1}] if items entity @s weapon.mainhand minecraft:totem_of_undying run item replace entity @s weapon.mainhand with totem_of_undying[item_name={"text":"Escarchita"},item_model="melklyth_escarchita"]
execute as @a[scores={escarchita=-1}] run scoreboard players set @s escarchita 0
execute as @a[scores={used_totem=1,used_escarchita=1..}] run tellraw @a [{"text":"¡Escarchita ha helado la muerte con su pelaje convirtiendo en un polo a ",color:"yellow"},{"selector":"@s",color:"gold",bold:true},{text:" en el proceso!",color:"yellow"}]


execute as @a[scores={star=-1}] if items entity @s weapon.mainhand minecraft:totem_of_undying run playsound block.note_block.bell master @s ~ ~ ~ 1000 0.7
execute as @a[scores={star=-1}] if items entity @s weapon.mainhand minecraft:totem_of_undying run item replace entity @s weapon.mainhand with totem_of_undying[item_name={"text":"Star"},item_model="estela_star"]
execute as @a[scores={star=-1}] run scoreboard players set @s star 0
execute as @a[scores={used_totem=1,used_star=1..}] run tellraw @a [{"text":"¡El deseo de ",color:"yellow"},{"selector":"@s",color:"gold",bold:true},{text:" se ha cumplido, dándole una segunda oportunidad!",color:"yellow"}]


execute as @a[scores={fiona=-1}] if items entity @s weapon.mainhand minecraft:totem_of_undying run playsound block.note_block.bell master @s ~ ~ ~ 1000 0.8
execute as @a[scores={fiona=-1}] if items entity @s weapon.mainhand minecraft:totem_of_undying run item replace entity @s weapon.mainhand with totem_of_undying[item_name={"text":"Fiona"},item_model="ernesto_fiona"]
execute as @a[scores={fiona=-1}] run scoreboard players set @s fiona 0
execute as @a[scores={used_totem=1,used_fiona=1..}] run tellraw @a [{"text":"¡Fiona ha aplastado la muerte salvando a ",color:"yellow"},{"selector":"@s",color:"gold",bold:true},{text:" de una muerte segura!",color:"yellow"}]


execute as @a[scores={kiki=-1}] if items entity @s weapon.mainhand minecraft:totem_of_undying run playsound block.note_block.bell master @s ~ ~ ~ 1000 0.9
execute as @a[scores={kiki=-1}] if items entity @s weapon.mainhand minecraft:totem_of_undying run item replace entity @s weapon.mainhand with totem_of_undying[item_name={"text":"Kiki"},item_model="belbio_kiki"]
execute as @a[scores={kiki=-1}] run scoreboard players set @s kiki 0
execute as @a[scores={used_totem=1,used_kiki=1..}] run tellraw @a [{"text":"¡Kiki ha empalado la muerte y a ",color:"yellow"},{"selector":"@s",color:"gold",bold:true},{text:" le gustaría darle un abrazo, pero pincha mucho!",color:"yellow"}]


execute as @a[scores={jann=-1}] if items entity @s weapon.mainhand minecraft:totem_of_undying run playsound block.note_block.bell master @s ~ ~ ~ 1000 1
execute as @a[scores={jann=-1}] if items entity @s weapon.mainhand minecraft:totem_of_undying run item replace entity @s weapon.mainhand with totem_of_undying[item_name={"text":"Jann"},item_model="addy_jann"]
execute as @a[scores={jann=-1}] run scoreboard players set @s jann 0
execute as @a[scores={used_totem=1,used_jann=1..}] run tellraw @a [{"text":"¡Jann ha intimidado la muerte salvando a ",color:"yellow"},{"selector":"@s",color:"gold",bold:true},{text:" aunque también le ha intimidado!",color:"yellow"}]


execute as @a[scores={lancer=-1}] if items entity @s weapon.mainhand minecraft:totem_of_undying run playsound block.note_block.bell master @s ~ ~ ~ 1000 1.1
execute as @a[scores={lancer=-1}] if items entity @s weapon.mainhand minecraft:totem_of_undying run item replace entity @s weapon.mainhand with totem_of_undying[item_name={"text":"Lancer"},item_model="willy_lancer"]
execute as @a[scores={lancer=-1}] run scoreboard players set @s lancer 0
execute as @a[scores={used_totem=1,used_lancer=1..}] run tellraw @a [{"text":"¡Lancer es TAN malo que la muerte ha huido y se ha olvidado de ",color:"yellow"},{"selector":"@s",color:"gold",bold:true},{text:"!",color:"yellow"}]


execute as @a[scores={laser=-1}] if items entity @s weapon.mainhand minecraft:totem_of_undying run playsound block.note_block.bell master @s ~ ~ ~ 1000 1.2
execute as @a[scores={laser=-1}] if items entity @s weapon.mainhand minecraft:totem_of_undying run item replace entity @s weapon.mainhand with totem_of_undying[item_name={"text":"Laser"},item_model="jolyne_laser"]
execute as @a[scores={laser=-1}] run scoreboard players set @s laser 0
execute as @a[scores={used_totem=1,used_laser=1..}] run tellraw @a [{"text":"¡Láser le ha lanzado ¿láseres? a la muerte y ",color:"yellow"},{"selector":"@s",color:"gold",bold:true},{text:" está muy orgullos@ de su pequeño Superman!",color:"yellow"}]


execute as @a[scores={manchas=-1}] if items entity @s weapon.mainhand minecraft:totem_of_undying run playsound block.note_block.bell master @s ~ ~ ~ 1000 1.3
execute as @a[scores={manchas=-1}] if items entity @s weapon.mainhand minecraft:totem_of_undying run item replace entity @s weapon.mainhand with totem_of_undying[item_name={"text":"Manchas"},item_model="adiac_manchas"]
execute as @a[scores={manchas=-1}] run scoreboard players set @s manchas 0
execute as @a[scores={used_totem=1,used_manchas=1..}] run tellraw @a [{"text":"¡Manchas no puede permitir que  ",color:"yellow"},{"selector":"@s",color:"gold",bold:true},{text:" no le siga malcriando y lo ha salvado!",color:"yellow"}]


execute as @a[scores={mika=-1}] if items entity @s weapon.mainhand minecraft:totem_of_undying run playsound block.note_block.bell master @s ~ ~ ~ 1000 1.4
execute as @a[scores={mika=-1}] if items entity @s weapon.mainhand minecraft:totem_of_undying run item replace entity @s weapon.mainhand with totem_of_undying[item_name={"text":"Mika"},item_model="sama_mika"]
execute as @a[scores={mika=-1}] run scoreboard players set @s mika 0
execute as @a[scores={used_totem=1,used_mika=1..}] run tellraw @a [{"text":"¡Mika le ha dado tanta ternura a la muerte que ha decidido dejar con vida a ",color:"yellow"},{"selector":"@s",color:"gold",bold:true},{text:"!",color:"yellow"}]


execute as @a[scores={mixu=-1}] if items entity @s weapon.mainhand minecraft:totem_of_undying run playsound block.note_block.bell master @s ~ ~ ~ 1000 1.5
execute as @a[scores={mixu=-1}] if items entity @s weapon.mainhand minecraft:totem_of_undying run item replace entity @s weapon.mainhand with totem_of_undying[item_name={"text":"Mixu"},item_model="cluc_mixu"]
execute as @a[scores={mixu=-1}] run scoreboard players set @s mixu 0
execute as @a[scores={used_totem=1,used_mixu=1..}] run tellraw @a [{"text":"¡Mixu ha decidido que ",color:"yellow"},{"selector":"@s",color:"gold",bold:true},{text:" le importa y le ha salvado!",color:"yellow"}]


execute as @a[scores={neri=-1}] if items entity @s weapon.mainhand minecraft:totem_of_undying run playsound block.note_block.bell master @s ~ ~ ~ 1000 1.6
execute as @a[scores={neri=-1}] if items entity @s weapon.mainhand minecraft:totem_of_undying run item replace entity @s weapon.mainhand with totem_of_undying[item_name={"text":"Neri"},item_model="nebluno_neri"]
execute as @a[scores={neri=-1}] run scoreboard players set @s neri 0
execute as @a[scores={used_totem=1,used_neri=1..}] run tellraw @a [{"text":"¡Neri ha salido volando junto a ",color:"yellow"},{"selector":"@s",color:"gold",bold:true},{text:" escabuyéndose de la muerte!",color:"yellow"}]


execute as @a[scores={patitas=-1}] if items entity @s weapon.mainhand minecraft:totem_of_undying run playsound block.note_block.bell master @s ~ ~ ~ 1000 1.7
execute as @a[scores={patitas=-1}] if items entity @s weapon.mainhand minecraft:totem_of_undying run item replace entity @s weapon.mainhand with totem_of_undying[item_name={"text":"Patitas"},item_model="umiempi_patitas"]
execute as @a[scores={patitas=-1}] run scoreboard players set @s patitas 0
execute as @a[scores={used_totem=1,used_patitas=1..}] run tellraw @a [{"text":"¡Patitas le ha dado un masaje a ",color:"yellow"},{"selector":"@s",color:"gold",bold:true},{text:" con sus patitas!",color:"yellow"}]


execute as @a[scores={ralsei=-1}] if items entity @s weapon.mainhand minecraft:totem_of_undying run playsound block.note_block.bell master @s ~ ~ ~ 1000 1.8
execute as @a[scores={ralsei=-1}] if items entity @s weapon.mainhand minecraft:totem_of_undying run item replace entity @s weapon.mainhand with totem_of_undying[item_name={"text":"Ralsei"},item_model="phavern_ralsei"]
execute as @a[scores={ralsei=-1}] run scoreboard players set @s ralsei 0
execute as @a[scores={used_totem=1,used_ralsei=1..}] run tellraw @a [{"text":"¡Ralsei le ha hecho un pastel a ",color:"yellow"},{"selector":"@s",color:"gold",bold:true},{text:" y le ha dado una segunda vida!",color:"yellow"}]


execute as @a[scores={rich=-1}] if items entity @s weapon.mainhand minecraft:totem_of_undying run playsound block.note_block.bell master @s ~ ~ ~ 1000 1.9
execute as @a[scores={rich=-1}] if items entity @s weapon.mainhand minecraft:totem_of_undying run item replace entity @s weapon.mainhand with totem_of_undying[item_name={"text":"Rich"},item_model="pamme_rich"]
execute as @a[scores={rich=-1}] run scoreboard players set @s rich 0
execute as @a[scores={used_totem=1,used_rich=1..}] run tellraw @a [{"text":"¡Rich le ha donado la poca cordura que le queda a ",color:"yellow"},{"selector":"@s",color:"gold",bold:true},{text:" evitando la demencia!",color:"yellow"}]


execute as @a[scores={thor=-1}] if items entity @s weapon.mainhand minecraft:totem_of_undying run playsound block.note_block.bell master @s ~ ~ ~ 1000 2
execute as @a[scores={thor=-1}] if items entity @s weapon.mainhand minecraft:totem_of_undying run item replace entity @s weapon.mainhand with totem_of_undying[item_name={"text":"Thor"},item_model="karen_thor"]
execute as @a[scores={thor=-1}] if items entity @s weapon.mainhand minecraft:totem_of_undying run scoreboard players set @s thor 0
execute as @a[scores={used_totem=1,used_thor=1..}] run tellraw @a [{"text":"¡Thor le ha metido un martillazo en la cabeza a la muerte y ha salvado a ",color:"yellow"},{"selector":"@s",color:"gold",bold:true},{text:" de volverse un poco Loki!",color:"yellow"}]


execute as @a[scores={hds=-1}] if items entity @s weapon.mainhand minecraft:totem_of_undying run playsound block.note_block.bell master @s ~ ~ ~ 1000 0.1
execute as @a[scores={hds=-1}] if items entity @s weapon.mainhand minecraft:totem_of_undying run item replace entity @s weapon.mainhand with totem_of_undying[item_name={"text":"HDS"},item_model="vorti_hds"]
execute as @a[scores={hds=-1}] run scoreboard players set @s hds 0
execute as @a[scores={used_totem=1,used_hds=1..}] run tellraw @a [{"text":"¡",color:"yellow"},{"selector":"@s",color:"gold",bold:true},{text:" ha vuelto a empezar el ciclo!",color:"yellow"}]


execute as @a[scores={totem=-1}] if items entity @s weapon.mainhand minecraft:totem_of_undying run playsound block.note_block.bell master @s ~ ~ ~ 1000 0.2
execute as @a[scores={totem=-1}] if items entity @s weapon.mainhand minecraft:totem_of_undying run item replace entity @s weapon.mainhand with totem_of_undying[item_name={"text":"Old totem"},item_model="crisho_totem"]
execute as @a[scores={totem=-1}] run scoreboard players set @s totem 0
execute as @a[scores={used_totem=1,used_oldtotem=1..}] run tellraw @a [{"text":"¡Tanta nostálgia le ha dado una segunda vida a ",color:"yellow"},{"selector":"@s",color:"gold",bold:true},{text:"!",color:"yellow"}]


execute as @a[scores={dunya=-1}] if items entity @s weapon.mainhand minecraft:totem_of_undying run playsound block.note_block.bell master @s ~ ~ ~ 1000 0.3
execute as @a[scores={dunya=-1}] if items entity @s weapon.mainhand minecraft:totem_of_undying run item replace entity @s weapon.mainhand with totem_of_undying[item_name={"text":"Dunya"},item_model="whiswiim_dunya"]
execute as @a[scores={dunya=-1}] run scoreboard players set @s dunya 0
execute as @a[scores={used_totem=1,used_dunya=1..}] run tellraw @a [{"text":"¡Dunya ha mostrado tanta indiferencia que ",color:"yellow"},{"selector":"@s",color:"gold",bold:true},{text:" se ha preocupado tanto por ella, que se ha curado!",color:"yellow"}]


execute as @a[scores={luna=-1}] if items entity @s weapon.mainhand minecraft:totem_of_undying run playsound block.note_block.bell master @s ~ ~ ~ 1000 0.4
execute as @a[scores={luna=-1}] if items entity @s weapon.mainhand minecraft:totem_of_undying run item replace entity @s weapon.mainhand with totem_of_undying[item_name={"text":"Luna"},item_model="sophia_luna"]
execute as @a[scores={luna=-1}] run scoreboard players set @s luna 0
execute as @a[scores={used_totem=1,used_luna=1..}] run tellraw @a [{"text":"¡Luna ha salvado a ",color:"yellow"},{"selector":"@s",color:"gold",bold:true},{text:" de manera épica!",color:"yellow"}]


execute as @a[scores={yuki=-1}] if items entity @s weapon.mainhand minecraft:totem_of_undying run playsound block.note_block.bell master @s ~ ~ ~ 1000 0.5
execute as @a[scores={yuki=-1}] if items entity @s weapon.mainhand minecraft:totem_of_undying run item replace entity @s weapon.mainhand with totem_of_undying[item_name={"text":"Yuki"},item_model="mati_yuki"]
execute as @a[scores={yuki=-1}] run scoreboard players set @s yuki 0
execute as @a[scores={used_totem=1,used_yuki=1..}] run tellraw @a [{"text":"¡Yuki ha ronroneado, provocando tanta ternura a ",color:"yellow"},{"selector":"@s",color:"gold",bold:true},{text:" que le ha curado!",color:"yellow"}]


execute as @a[scores={used_totem=1}] run scoreboard players set @s used_totem 0