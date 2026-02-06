# Contexto:
servidor de minecraft 1.21.11
datapack 100% vanilla



# Objetivos:
## Icono PrankLevel (siempre necesario y siempre visible)
Se necesita un icono que muestre el nivel de prank al lado del nombre con un caracter unicode tipo:
⓪ ① ② ③ ④ ⑤

## Icono grabando
un punto rojo a la derecha del icono prank visible si la tag esta activa

## Icono directo
un punto morado a la derecha del icono prank visible si la tag esta activa

# Como?

Se pretende usar equipos para las combinaciones posibles que se asignen automaticamente segun los valores de las tags.

## Como?

Las tags se pretende que sean en base a un comando

/function tr:prank/0 seria el nivel 0
y asi para cada nivel
/function tr:recording
seria un toggle
/function tr:streaming
seria un toggle


## Tags de los usuarios:

Prank (0-5)
Recording (0-1)
Streaming (0-1)

# Necesidades:

que nada más entrar al juego el jugador obtenga las tags con el valor cero por defecto.