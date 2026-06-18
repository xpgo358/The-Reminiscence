execute as @a[scores={afk-status=1}] run function tr:control/joining_warnings/afk/control
execute as @a[scores={afk-status=0, recording-status=1, streaming-status=0}] run function tr:control/joining_warnings/recording/control
execute as @a[scores={afk-status=0, recording-status=0, streaming-status=1}] run function tr:control/joining_warnings/streaming/control
execute as @a[scores={afk-status=0, recording-status=1, streaming-status=1}] run function tr:control/joining_warnings/both/control