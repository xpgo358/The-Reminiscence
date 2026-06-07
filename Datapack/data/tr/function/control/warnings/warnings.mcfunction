execute as @a[scores={afk-status=1}] run function tr:control/warnings/afk/display_actionbar

## POR SI ALGUN DIA QUIEREN LA FUNCIÓN :(

# execute as @a[scores={afk-status=0, recording-status=1, streaming-status=0}] run function tr:control/warnings/recording/display_actionbar
# execute as @a[scores={afk-status=0, recording-status=0, streaming-status=1}] run function tr:control/warnings/streaming/display_actionbar
# execute as @a[scores={afk-status=0, recording-status=1, streaming-status=1}] run function tr:control/warnings/both/display_actionbar