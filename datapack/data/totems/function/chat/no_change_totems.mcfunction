execute as @a[scores={nototem=-1}] run playsound minecraft:block.note_block.bass master @s ~ ~ ~ 1000 0.3
execute as @a[tag=nosneaking] run tag @s remove nosneaking
scoreboard players set @a[scores={nototem=-1}] nototem 0