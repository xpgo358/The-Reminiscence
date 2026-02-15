#Enviar mensaje de confirmación para cambiar el tótem
tellraw @p [{"bold":true,"italic":false,"color":"#f34646","text":"\n\n\n\s\s\s\s\s\s\s\s\s¿Quieres cambiar el modelo del tótem?\n\n\n\n"},{text:"\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s"},{"bold":true,"click_event":{"action":"run_command","command":"trigger sitotem add -1"},"color":"#0BE03D","italic":false,"text":"[Sí]"},{text:"\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s\s"},{"bold":true,"click_event":{"action":"run_command","command":"trigger nototem add -1"},"color":"#CC1B1B","italic":false,"text":"[No]"},{"text":"\n\n"}]
playsound block.note_block.bell master @s ~ ~ ~ 1000 1.5
scoreboard players set @s sitotem 0
scoreboard players set @s nototem 0