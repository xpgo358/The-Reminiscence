title @a reset
title @a clear
title @a actionbar {"text":"Courtesy of TR","color":"dark_red", italic:true}
title @a subtitle {text:"Mira Discord para más información","color":"dark_red"}
title @a times 1s 5s 1s
title @a title [{"text":"☠ ","color":"dark_red",bold:false},{text:"NUEVO CHALLENGE",color:"dark_red",bold:true},{text:" ☠","color":"dark_red",bold:false}]
tellraw @a [{"text":"☠ ","color":"dark_red",bold:false},{text:"NUEVO CHALLENGE",color:"dark_red",bold:true},{text:" ☠","color":"dark_red",bold:false}]
tellraw @a {text:"Mira Discord para más información","color":"dark_red"}
execute at @a run playsound minecraft:entity.wither.spawn master @a ~ ~ ~ 1 0.5