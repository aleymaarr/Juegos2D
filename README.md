# Juegos2D

Documentación de Scripts del Juego 2D

Moneda (Coin)

Descripción
Este script se adjunta a un objeto Area2D que representa una moneda en el juego. Cuando el jugador entra en contacto con la moneda, se dispara un evento que aumenta el contador de monedas del jugador y luego elimina la moneda del juego.

Componentes
extends Area2D: Extiende la funcionalidad de Area2D.
signal coinCollected: Señal para indicar que se ha recogido una moneda.
func _on_Coin2D_body_entered(body): Función que detecta la colisión con el jugador y ejecuta la lógica de recolección de monedas.
UI Control

Descripción
Controla la interfaz de usuario principal, gestionando la lógica de los botones de iniciar juego y salir del juego.

Componentes
extends Control: Extiende la funcionalidad de Control.
func _ready(): Se centra en el botón de inicio del juego cuando la UI está lista.
func _on_StartGameButton_pressed(): Cambia la escena al mundo del juego cuando se presiona el botón de inicio.
func _on_QuitButton_pressed(): Cierra el juego cuando se presiona el botón de salir.
Jugador (Player)

Descripción
Define el comportamiento del personaje del jugador, incluyendo movimiento, salto, y la lógica de colisión con objetos dañinos.

Componentes
extends KinematicBody2D: Extiende la funcionalidad de KinematicBody2D.
Variables de movimiento y salto: Define la velocidad, la gravedad, y la altura del salto.
func _physics_process(delta): Gestiona el movimiento y animaciones del jugador.
func add_Coin(): Incrementa el contador de monedas del jugador.
func _loseLife(): Se llama cuando el jugador sufre daño o pierde una vida.
Daño por Pinchos (Spikes Damage)

Descripción
Script adjunto a objetos que dañan al jugador, como pinchos. Reinicia la escena cuando el jugador colisiona con ellos.

Componentes
extends Area2D o Node2D: Dependiendo del objeto, extiende Area2D o Node2D.
func _on_Object_body_entered(body): Detecta la colisión con el jugador y ejecuta la lógica de daño.
Vida y Daño

Descripción
Estos scripts controlan las interacciones del jugador con objetos que pueden causar la pérdida de una vida o reiniciar la escena, como caídas o colisiones con sierras.

Componentes
func _on_Area2D_body_entered(body): Funciones que se llaman cuando el jugador entra en contacto con un área dañina, ejecutando la lógica correspondiente.
