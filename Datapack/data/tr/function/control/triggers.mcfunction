## Detect triggers

# AFK (0=No, 1=Yes)
execute as @a[scores={afk=0..,afk-status=0}] run tag @s add tr_afk_on
execute as @a[scores={afk=0..,afk-status=1}] run tag @s add tr_afk_off
execute as @a[tag=tr_afk_on] run scoreboard players set @s afk-status 1
execute as @a[tag=tr_afk_off] run scoreboard players set @s afk-status 0
function tr:admin/update_teams
execute as @a[tag=tr_afk_off] run tellraw @a [{"text":"¡","color":"gray",bold:false},{"selector":"@s",color:"gold",bold:true},{"text":" ya no está AFK!","color":"gray",bold:false}]
execute as @a[tag=tr_afk_on] run tellraw @a [{"text":"¡","color":"gray",bold:false},{"selector":"@s",color:"gold",bold:true},{"text":" está AFK!","color":"gray",bold:false}]
execute as @a[tag=tr_afk_on] run tag @s remove tr_afk_on
execute as @a[tag=tr_afk_off] run tag @s remove tr_afk_off

# Update Prank Level (0-5)
execute as @a[scores={prank=0..5}] run scoreboard players operation @s prank-level = @s prank

# Update Streaming (0=No, 1=Yes)
execute as @a[scores={streaming=0..,streaming-status=0}] run tag @s add tr_stream_on
execute as @a[scores={streaming=0..,streaming-status=1}] run tag @s add tr_stream_off
execute as @a[tag=tr_stream_on] run scoreboard players set @s streaming-status 1
execute as @a[tag=tr_stream_off] run scoreboard players set @s streaming-status 0
function tr:admin/update_teams
execute as @a[tag=tr_stream_off] run tellraw @a [{"text":"¡","color":"dark_purple",bold:false},{"selector":"@s",color:"gold",bold:true},{"text":" ya no está en directo!","color":"dark_purple",bold:false}]
execute as @a[tag=tr_stream_on] run tellraw @a [{"text":"¡","color":"dark_purple",bold:false},{"selector":"@s",color:"gold",bold:true},{"text":" está en directo!","color":"dark_purple",bold:false}]
execute as @a[tag=tr_stream_on] run tag @s remove tr_stream_on
execute as @a[tag=tr_stream_off] run tag @s remove tr_stream_off

# Update Recording (0=No, 1=Yes)
execute as @a[scores={recording=0..,recording-status=0}] run tag @s add tr_record_on
execute as @a[scores={recording=0..,recording-status=1}] run tag @s add tr_record_off
execute as @a[tag=tr_record_on] run scoreboard players set @s recording-status 1
execute as @a[tag=tr_record_off] run scoreboard players set @s recording-status 0
function tr:admin/update_teams
execute as @a[tag=tr_record_off] run tellraw @a [{"text":"¡","color":"red",bold:false},{"selector":"@s",color:"gold",bold:true},{"text":" ya no está grabando!","color":"red",bold:false}]
execute as @a[tag=tr_record_on] run tellraw @a [{"text":"¡","color":"red",bold:false},{"selector":"@s",color:"gold",bold:true},{"text":" está grabando!","color":"red",bold:false}]
execute as @a[tag=tr_record_on] run tag @s remove tr_record_on
execute as @a[tag=tr_record_off] run tag @s remove tr_record_off

# Locatorbar color picker
execute as @a[scores={color=0..}] run function tr:control/color/start
execute as @a[scores={color-step=1..6,colorpick=0..15}] run function tr:control/color/pick
execute as @a[scores={color-step=7,colorpick=1}] run function tr:control/color/apply
execute as @a[scores={color-step=7,colorpick=0}] run function tr:control/color/start

# Help
execute as @a[scores={help=1..}] run tellraw @s [{"text":"\n¡Ayuda del servidor!\n","color":"gold"},{"text":"- Prank: ","color":"yellow"},{"text":"Usa ","color":"white"},{"text":"/trigger prank set <nivel>","color":"aqua","italic":true},{"text":" para establecer tu nivel entre 0 y 5.\n","color":"white"},{"text":"- Streaming y Recording: ","color":"yellow"},{"text":"Usa ","color":"white"},{"text":"/trigger streaming","color":"aqua","italic":true},{"text":" y ","color":"white"},{"text":"/trigger recording","color":"aqua","italic":true},{"text":" para activar y desactivar, ya que funcionan como un interruptor.\n","color":"white"},{"text":"- AFK: ","color":"yellow"},{"text":"Usa ","color":"white"},{"text":"/trigger afk","color":"aqua","italic":true},{"text":" para activar y desactivar, ya que funciona como un interruptor.\n","color":"white"},{"text":"- Locatorbar color: ","color":"yellow"},{"text":"Usa ","color":"white"},{"text":"/trigger color","color":"aqua","italic":true},{"text":" para elegir los 6 dígitos hex de tu color.\n","color":"white"},{"text":"- Reglas: ","color":"yellow"},{"text":"Usa ","color":"white"},{"text":"/trigger rules","color":"aqua","italic":true},{"text":" para ver las reglas del servidor.\n","color":"white"},{"text":"- Ayuda: ","color":"yellow"},{"text":"Usa ","color":"white"},{"text":"/trigger help","color":"aqua","italic":true},{"text":" para ver este mensaje nuevamente.\n","color":"white"},{"text":"- Tótem: ","color":"yellow"},{"text":"Para cambiar la apariencia de tu tótem, ","color":"white"},{"text":"craftealo","color":"light_purple","italic":true},{"text":".\n","color":"white"},{"text":"¡Disfruta del servidor!\n","color":"green","italic":true}]
execute as @a[scores={rules=1..}] run tellraw @s [{"text":"\nReglas del servidor:\n","color":"gold"},{"text":"- Respeto: ","color":"yellow"},{"text":"Trata a todos los jugadores con respeto. No se toleran ","color":"white"},{"text":"insultos","color":"light_purple","italic":true},{"text":", ","color":"white"},{"text":"acoso","color":"light_purple","italic":true},{"text":" o ","color":"white"},{"text":"comportamientos tóxicos","color":"light_purple","italic":true},{"text":".\n","color":"white"},{"text":"- Trampas: ","color":"yellow"},{"text":"No uses ","color":"white"},{"text":"hacks","color":"light_purple","italic":true},{"text":", ","color":"white"},{"text":"X-ray","color":"light_purple","italic":true},{"text":" o ","color":"white"},{"text":"exploits","color":"light_purple","italic":true},{"text":".\n","color":"white"},{"text":"- Dupping: ","color":"yellow"},{"text":"No está permitido ","color":"white"},{"text":"duplicar items","color":"light_purple","italic":true},{"text":".\n","color":"white"},{"text":"- Comunicación: ","color":"yellow"},{"text":"Usa el chat de forma constructiva. No hagas ","color":"white"},{"text":"spam","color":"light_purple","italic":true},{"text":" ni ","color":"white"},{"text":"flood","color":"light_purple","italic":true},{"text":".\n","color":"white"},{"text":"- Conflicto: ","color":"yellow"},{"text":"Resuelve problemas civilizadamente. Si es necesario, ","color":"white"},{"text":"contacta con un mod","color":"aqua","italic":true},{"text":".\n","color":"white"},{"text":"- No Griefing: ","color":"yellow"},{"text":"No destruyas ","color":"white"},{"text":"construcciones ajenas","color":"light_purple","italic":true},{"text":".\n","color":"white"},{"text":"- No Robar: ","color":"yellow"},{"text":"No robes ","color":"white"},{"text":"items","color":"light_purple","italic":true},{"text":" de contenedores ajenos.\n","color":"white"},{"text":"- PVP: ","color":"yellow"},{"text":"Solo ","color":"white"},{"text":"con consentimiento mutuo","color":"aqua","italic":true},{"text":", excepto en zonas PvP libres.\n","color":"white"},{"text":"- Lag: ","color":"yellow"},{"text":"Evita ","color":"white"},{"text":"granjas masivas","color":"aqua","italic":true},{"text":" que causen lag al servidor.\n","color":"white"},{"text":"- Contenido +18: ","color":"yellow"},{"text":"Prohibido ","color":"white"},{"text":"NSFW","color":"light_purple","italic":true},{"text":".\n","color":"white"},{"text":"¡Gracias por mantener nuestra comunidad sana!\n","color":"green","italic":true}]

# Version
execute as @a[scores={version=1..}] run tellraw @s [{"text":"\nVersión del datapack\n","color":"gold"},{"text":"The Reminiscence SMP ","color":"yellow"},{"text":"v1.8","color":"light_purple","bold":true},{"text":"\nUsa ","color":"white"},{"text":"/trigger help","color":"aqua","italic":true},{"text":" para ver todos los triggers disponibles.\n","color":"white"}]

## Reset and Re-enable triggers for everyone every tick

# AFK
scoreboard players set @a afk -1
scoreboard players enable @a afk

# Prank level
scoreboard players set @a prank -1
scoreboard players enable @a prank

# Streaming
scoreboard players set @a streaming -1
scoreboard players enable @a streaming

# Recording
scoreboard players set @a recording -1
scoreboard players enable @a recording

# Help
scoreboard players reset @a help
scoreboard players enable @a help

# Rules
scoreboard players reset @a rules
scoreboard players enable @a rules

# Version
scoreboard players reset @a version
scoreboard players enable @a[scores={afk-status=1,prank-level=3,streaming-status=1,recording-status=1}] version

# Locatorbar color
scoreboard players set @a color -1
scoreboard players enable @a color
scoreboard players set @a colorpick -1
scoreboard players enable @a[scores={color-step=1..7}] colorpick