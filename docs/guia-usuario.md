# 📖 The Reminiscence SMP — Guía de Usuario

> **Versión del datapack:** v1.8.1 · **Minecraft:** 1.21.11

Bienvenido al datapack de **The Reminiscence SMP**. Esta guía te explica todo lo que puedes hacer como jugador, sin necesidad de conocimientos técnicos.

---

## 🎮 ¿Qué hace este datapack?

El datapack añade tres grandes bloques de contenido al servidor:

1. **Sistema de jugador** — controla tu estado visible (AFK, streaming, grabando, nivel de pranks y color de waypoint).
2. **Calidad de vida** — el sueño en el servidor es más fácil y los vehículos van más rápido.
3. **Tótems personalizados** — tótems con el nombre y la imagen de las mascotas/personajes de los jugadores.

---

## ⚡ Comandos disponibles (`/trigger`)

Todos los comandos que puedes usar como jugador normal funcionan con `/trigger`. Escríbelos en el chat.

### 📋 Ayuda y reglas

| Comando | ¿Qué hace? |
|---------|-----------|
| `/trigger help` | Muestra todos los triggers disponibles y cómo usarlos |
| `/trigger rules` | Muestra las reglas del servidor |
| `/trigger version` | Muestra la versión actual del datapack |

---

### 💤 AFK (Estoy ausente)

```
/trigger afk
```

Activa o desactiva tu estado **AFK** (Away From Keyboard). Cuando estás AFK:

- Tu nombre en pantalla muestra el símbolo **⌀** y el icono de la dimensión en la que estás (☀ Overworld, 🔥 Nether, ✦ End).
- Todos los jugadores del servidor ven un mensaje cuando entras o sales del modo AFK.
- **No cuentas para el cálculo de dormir** — si estás AFK, no hace falta que duermas para que pase la noche.

---

### 😈 Nivel de Pranks

```
/trigger prank set <número>
```

Elige qué tipo de bromas o "pranks" aceptas que te hagan otros jugadores. Pon un número del **0 al 5**:

| Nivel | Símbolo | ¿Qué acepto? |
|-------|---------|-------------|
| `0` | ⓪ (gris) | No acepto ningún prank |
| `1` | ① (verde) | Solo pranks leves, sin daño ni destrucción |
| `2` | ② (amarillo) | Pranks más elaboradas, daño material pequeño permitido |
| `3` | ③ (dorado) | Pranks grandes y sorprendentes, no demasiado destructivas |
| `4` | ④ (rojo) | Pranks que pueden ser mortales, sin pérdidas materiales graves |
| `5` | ⑤ (rojo oscuro) | Cualquier tipo de prank, sin límites |

Tu nivel aparece como un número con círculo junto a tu nombre en pantalla.

---

### 📹 Streaming y Grabación

```
/trigger streaming
/trigger recording
```

Activa o desactiva si estás **en directo** (streaming) o **grabando** un vídeo. Cuando los activas:

- Tu nombre muestra un punto de color: **●** morado para streaming, **●** rojo para grabación.
- El servidor avisa a todos los jugadores cuando empiezas o terminas.
- Al pasar el ratón por encima de tu nombre, los demás pueden leer un aviso sobre tu contenido.

---

### 🎨 Color de tu Waypoint (Locatorbar)

```
/trigger color
```

Te permite elegir el **color de tu icono en la barra de localización** usando un código hexadecimal de 6 dígitos (por ejemplo, `FF0000` para rojo, `00FF00` para verde).

El proceso funciona en 6 pasos: cada paso te pide que hagas clic en el dígito hexadecimal que quieres (0–9 o A–F). Al terminar, se te muestra el color para que lo confirmes o lo repitas.

---

## 😴 Sistema de dormir

El servidor usa un sistema de dormir **inteligente**: no hace falta que duerma todo el mundo para que pase la noche. Solo necesita dormir **aproximadamente 1 de cada 4 jugadores activos**.

> **Jugadores activos** son los que están en el Overworld y no están en modo AFK.

---

## 🚗 Vehículos más rápidos

Puedes craftar un ítem especial llamado **"Everything on a Stick"** que hace que tus vehículos vayan más rápido.

### Receta de crafteo (sin forma, en cualquier orden)

| Ingrediente |
|-------------|
| Warped Fungus (Hongo Carmesí Distorsionado) |
| Snowball (Bola de Nieve) |
| Carrot (Zanahoria) |
| Fishing Rod (Caña de Pescar) |

El resultado es un reloj con el nombre "Everything on a Stick".

### ¿Cómo funciona?

Mientras montes a un **cerdo**, **strider** o **happy ghast**, lleva el ítem en **mano principal o secundaria** y se moverá más rápido:

| Vehículo | Aumento de velocidad |
|----------|---------------------|
| Cerdo | +0.1 de velocidad de movimiento |
| Strider | +0.1 de velocidad de movimiento |
| Happy Ghast | +0.025 de velocidad de vuelo |

---

## 🏺 Tótems Personalizados

Cada jugador tiene su **tótem personalizado** con el nombre y apariencia de su mascota o personaje favorito. Para conseguirlo:

1. Consigue un **Tótem de Inmortalidad** (`totem_of_undying`).
2. Ponlo en la mesa de crafteo junto con el **ingrediente único** de tu tótem.
3. El resultado será tu tótem personalizado.

Cuando el tótem te **salva de la muerte**, aparece un mensaje especial para todo el servidor.

### Lista de tótems disponibles

| Jugador | Nombre del tótem | Ingrediente |
|---------|-----------------|-------------|
| Addy | Jann | Bola de Nieve |
| Adiac | Manchas | Huevo Azul |
| Belbio | Kiki | Escama de Armadillo |
| Boom | TNT | Pólvora |
| Cluc | Mixu | Pepita de Hierro |
| Crisho | Old Totem | Diente de León + Lingote de Oro |
| Dalox | Azalea | Azalea Florida |
| Ernesto | Fiona | Carne de Res |
| Estela | Star | Polvo de Piedra Luminosa |
| Isma | Critical Fail | Pepita de Cobre |
| Jolyne | Laser | Chuleta de Cerdo |
| Karen | Thor | Wind Charge |
| Kris | The Knight | Botella de Miel |
| Laura | Burbuja | Redstone |
| Lu | Lala | Brote de Amatista Mediano |
| Mati | Yuki | Fragmento de Amatista |
| Melklyth | Escarchita | Zanahoria |
| Nebluno | Neri | Pluma |
| Pamme | Rich | Rosa Marchita |
| Phavern | Ralsei | Tarta |
| Phos | Danny | Hilo |
| Sama | Mika | Lila |
| Sophia | Luna | Orquídea Azul |
| Umiempi | Patitas | Tinte Gris |
| Vaynilo | Felipe | Tinte Gris Claro |
| Vorti | HDS | Amapola |
| Whiswiim | Dünya | Bayas Dulces |
| Willy | Lancer | Papel |
| XP | Baku | Salmón |
| Zer | Bullet | Alfombra Roja |

---

## ❓ ¿Necesitas más ayuda?

Escribe `/trigger help` en el juego para ver un resumen de todos los comandos disponibles.  
Para dudas más detalladas, consulta los anuncios y eventos en el **Discord del servidor**.
