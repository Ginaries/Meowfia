extends Node2D
@onready var timer: Timer = $Spawn/Timer
@onready var escena_de_batalla: Node2D = $"Escena de batalla"

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("escape"):
		get_tree().quit()
	#agregar muerte del player salir del juego al menu

func _on_spawn_body_entered(body: Node2D) -> void:
	timer.start(5.0)

func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://Scene/EscenaDeBatalla/escena_de_batalla.tscn")
