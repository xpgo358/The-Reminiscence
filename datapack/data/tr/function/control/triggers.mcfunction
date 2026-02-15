## Detect triggers

# Update Prank Level (0-5)
execute as @a[scores={prank=0..5}] run scoreboard players operation @s prank-level = @s prank

# Update Streaming (0=No, 1=Yes)
execute as @a[scores={streaming=0..1}] run scoreboard players operation @s streaming-status = @s streaming

# Update Recording (0=No, 1=Yes)
execute as @a[scores={recording=0..1}] run scoreboard players operation @s recording-status = @s recording

# Help
execute as @a[scores={help=1..}] run tellraw @s [{"text":"\n¡Ayuda del servidor!\n","color":"gold"},{"text":"- Prank: ","color":"yellow"},{"text":"Usa ","color":"white"},{"text":"/trigger prank set <nivel>","color":"aqua","italic":true},{"text":" para establecer tu nivel entre 0 y 5.\n","color":"white"},{"text":"- Streaming y Recording: ","color":"yellow"},{"text":"Usa ","color":"white"},{"text":"/trigger streaming set <0 o 1>","color":"aqua","italic":true},{"text":" y ","color":"white"},{"text":"/trigger recording set <0 o 1>","color":"aqua","italic":true},{"text":" para activar (1) o desactivar (0) estos modos.\n","color":"white"},{"text":"- Reglas: ","color":"yellow"},{"text":"Usa ","color":"white"},{"text":"/trigger rules","color":"aqua","italic":true},{"text":" para ver las reglas del servidor.\n","color":"white"},{"text":"- Ayuda: ","color":"yellow"},{"text":"Usa ","color":"white"},{"text":"/trigger help","color":"aqua","italic":true},{"text":" para ver este mensaje nuevamente.\n","color":"white"},{"text":"- Tótem: ","color":"yellow"},{"text":"Para cambiar la apariencia de tu tótem, ","color":"white"},{"text":"shiftea 3 veces seguidas","color":"light_purple","italic":true},{"text":" mientras lo sujetas.\n","color":"white"},{"text":"¡Disfruta del servidor!\n","color":"green","italic":true}]

# Rules
execute as @a[scores={rules=1..}] run tellraw @s [{"text":"\nReglas del servidor:\n","color":"gold"},{"text":"- Respeto: ","color":"yellow"},{"text":"Trata a todos los jugadores con respeto. No se toleran ","color":"white"},{"text":"insultos","color":"light_purple","italic":true},{"text":", ","color":"white"},{"text":"acoso","color":"light_purple","italic":true},{"text":" o ","color":"white"},{"text":"comportamientos tóxicos","color":"light_purple","italic":true},{"text":".\n","color":"white"},{"text":"- Trampas: ","color":"yellow"},{"text":"No uses ","color":"white"},{"text":"hacks","color":"light_purple","italic":true},{"text":", ","color":"white"},{"text":"X-ray","color":"light_purple","italic":true},{"text":" o ","color":"white"},{"text":"exploits","color":"light_purple","italic":true},{"text":".\n","color":"white"},{"text":"- Dupping: ","color":"yellow"},{"text":"No está permitido ","color":"white"},{"text":"duplicar items","color":"light_purple","italic":true},{"text":".\n","color":"white"},{"text":"- Comunicación: ","color":"yellow"},{"text":"Usa el chat de forma constructiva. No hagas ","color":"white"},{"text":"spam","color":"light_purple","italic":true},{"text":" ni ","color":"white"},{"text":"flood","color":"light_purple","italic":true},{"text":".\n","color":"white"},{"text":"- Conflicto: ","color":"yellow"},{"text":"Resuelve problemas civilizadamente. Si es necesario, ","color":"white"},{"text":"contacta con un mod","color":"aqua","italic":true},{"text":".\n","color":"white"},{"text":"- No Griefing: ","color":"yellow"},{"text":"No destruyas ","color":"white"},{"text":"construcciones ajenas","color":"light_purple","italic":true},{"text":".\n","color":"white"},{"text":"- No Robar: ","color":"yellow"},{"text":"No robes ","color":"white"},{"text":"items","color":"light_purple","italic":true},{"text":" de contenedores ajenos.\n","color":"white"},{"text":"- PVP: ","color":"yellow"},{"text":"Solo ","color":"white"},{"text":"con consentimiento mutuo","color":"aqua","italic":true},{"text":", excepto en zonas PvP libres.\n","color":"white"},{"text":"- Lag: ","color":"yellow"},{"text":"Evita ","color":"white"},{"text":"granjas masivas","color":"aqua","italic":true},{"text":" que causen lag al servidor.\n","color":"white"},{"text":"- Contenido +18: ","color":"yellow"},{"text":"Prohibido ","color":"white"},{"text":"NSFW","color":"light_purple","italic":true},{"text":".\n","color":"white"},{"text":"¡Gracias por mantener nuestra comunidad sana!\n","color":"green","italic":true}]

## Reset and Re-enable triggers for everyone every tick

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