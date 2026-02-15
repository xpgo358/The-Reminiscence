#Detectar la respuesta al elegir si quieres cambiar el tótem
execute as @a[scores={sitotem=-1}] run function totems:chat/yes_change_totems
execute as @a[scores={nototem=-1}] run function totems:chat/no_change_totems