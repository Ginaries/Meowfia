extends Node2D
@onready var timer: Timer = $Spawn/Timer

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("escape"):
		get_tree().quit()
	#agregar muerte del player salir del juego al menu

func _on_spawn_body_entered(_body: Node2D) -> void:
	timer.start(5.0)


func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://Scene/EscenaDeBatalla/escena_de_batalla.tscn")


func _on_spawn_body_exited(body: Node2D) -> void:
	timer.stop()
