tag @s remove joined
tellraw @s [{"text":"¡Bienvenid@! No te olvides de revisar los anuncios y eventos en Discord y recuerda que puedes hacer ","color":"green"},{"text":"/trigger help","color":"aqua","italic":false},{"text":" para más ayuda.","color":"green"}]
scoreboard players set @s leave 0
playsound block.note_block.bell master @s ~ ~ ~ 1000 1
function tr:control/joining_warnings/joining_warnings
tag @s add joined


