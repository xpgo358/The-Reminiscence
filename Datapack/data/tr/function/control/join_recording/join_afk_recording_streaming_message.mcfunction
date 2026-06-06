execute as @a[team=recording] tellraw @s [{"text":"¡Estás todavía con la marca ","color":"green"},{"text":"recording!","color":"red","italic":false},{"text":" Usa /trigger recording","color":"green"},{"text":" para quitarlo. (Solo si no estás grabando, claro)","color":"green"}]

execute as @a[team=streaming] tellraw @s [{"text":"¡Estás todavía con la marca ","color":"green"},{"text":"recording!","color":"red","italic":false},{"text":" Usa /trigger recording","color":"green"},{"text":" para quitarlo. (Solo si no estás en stream, claro)","color":"green"}]

execute as @a[team=AFK_OVERWORLD] tellraw @s [{"text":"¡Estás todavía con la marca ","color":"green"},{"text":"afk!","color":"gray","italic":false},{"text":" Usa /trigger recording","color":"green"},{"text":" para quitarlo. (Solo si no estás afk, claro)","color":"green"}]
execute as @a[team=AFK_NETHER] tellraw @s [{"text":"¡Estás todavía con la marca ","color":"green"},{"text":"afk!","color":"gray","italic":false},{"text":" Usa /trigger recording","color":"green"},{"text":" para quitarlo. (Solo si no estás afk, claro)","color":"green"}]
execute as @a[team=AFK_END] tellraw @s [{"text":"¡Estás todavía con la marca ","color":"green"},{"text":"afk!","color":"gray","italic":false},{"text":" Usa /trigger recording","color":"green"},{"text":" para quitarlo. (Solo si no estás afk, claro)","color":"green"}]

playsound block.note_block.bell master @s ~ ~ ~ 1000 0.7