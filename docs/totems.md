# Tótems personalizados

El namespace `totems` gestiona recetas, detección de uso y mensajes personalizados para todos los tótems del datapack. Es una capa de personalización sobre el tótem de inmortalidad vanilla: cambia la apariencia, añade recetas temáticas y acompaña el uso con mensajes específicos.

## Puntos de entrada

- `totems:minecraft/load`
- `totems:minecraft/tick`

## Relacionado

- [Sistema TR](tr.md)
- [Sistema de dormir](qol/dormir.md)
- [Velocidades de vehículos](qol/vehiculos.md)

## Carga

En `load` se crea el scoreboard de detección y se desbloquean todas las recetas para todos los jugadores.

Eso deja el sistema listo desde el primer tick real de juego: las recetas ya existen en el libro de recetas y los contadores de detección están preparados para empezar a responder.

## Detección de uso

El sistema usa dos señales:

- `used_totem`: criterio vanilla que detecta cuando se consume un tótem de inmortalidad.
- `used_*`: contadores temporales por tótem que se mantienen durante unos ticks para asociar el uso con el modelo correcto.

Flujo resumido:

1. Se detecta si el jugador lleva un tótem personalizado en mano principal o secundaria.
2. Se fija un contador breve para ese modelo.
3. Cuando `used_totem` se activa, se comprueba qué contador sigue vivo.
4. Se muestra el mensaje correspondiente.

El contador de tres ticks actúa como ventana de correlación. No intenta medir cuánto dura el efecto; solo mantiene vivo el contexto el tiempo suficiente para capturar el evento correcto.

## Arquitectura de las recetas

Cada receta sigue un patrón uniforme:

- Base: `minecraft:totem_of_undying`.
- Grupo: `totems`.
- Categoría: `misc`.
- Resultado: un tótem con `item_name` y `item_model` personalizados.

Ese enfoque hace que las recetas sean fáciles de extender y de leer.

## Recetas incluidas

Cada receta parte de un `minecraft:totem_of_undying` y añade un ingrediente temático propio. Los archivos están en `Datapack/data/totems/recipe/`.

| Archivo | Resultado |
|---|---|
| `addy_jann.json` | Jann |
| `adiac_manchas.json` | Manchas |
| `belbio_kiki.json` | Kiki |
| `boom_tnt.json` | TNT |
| `cluc_mixu.json` | Mixu |
| `crisho_totem.json` | Old Totem |
| `dalox_azalea.json` | Azalea |
| `ernesto_fiona.json` | Fiona |
| `estela_star.json` | Star |
| `isma_fail.json` | Critical Fail |
| `jolyne_laser.json` | Laser |
| `karen_thor.json` | Thor |
| `kris_knight.json` | The Knight |
| `laura_burbuja.json` | Burbuja |
| `lu_lala.json` | Lala |
| `mati_yuki.json` | Yuki |
| `melklyth_escarchita.json` | Escarchita |
| `nebluno_neri.json` | Neri |
| `pamme_rich.json` | Rich |
| `phavern_ralsei.json` | Ralsei |
| `phos_danny.json` | Danny |
| `sama_mika.json` | Mika |
| `sophia_luna.json` | Luna |
| `umiempi_patitas.json` | Patitas |
| `vaynilo_felipe.json` | Felipe |
| `vorti_hds.json` | HDS |
| `whiswiim_dunya.json` | Dunya |
| `willy_lancer.json` | Lancer |
| `xp_baku.json` | Baku |
| `zer_bullet.json` | Bullet |

### Qué aportan

Las recetas no solo cambian el nombre. También dan identidad visual al tótem, permiten diferenciarlo en inventarios compartidos y hacen que el momento de salvarse tenga un peso temático propio para cada jugador o personaje.

## Observación técnica

El contador de unos pocos ticks evita falsos negativos por el orden en que vanilla consume el tótem y actualiza el criterio `used_totem`.

## Cómo leer el sistema

Si un tótem no muestra el mensaje esperado, las tres cosas que hay que revisar son:

1. Que el objeto realmente tenga el `item_model` correcto.
2. Que el contador `used_*` se esté activando al sostenerlo.
3. Que `used_totem` esté detectando la salvación real del jugador.

## Mantenimiento

La estructura está pensada para añadir nuevos tótems sin tocar el diseño general. Basta con seguir el patrón de receta, añadir el contador correspondiente en `use_totem.mcfunction` y definir el mensaje final.