extends Node2D
@onready var timer: Timer = $Spawn/Timer

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("escape"):
		get_tree().quit()
	#agregar muerte del player salir del juego al menu
