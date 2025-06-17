extends Area2D
@onready var timer: Timer = $Timer


func _on_spawn_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		timer.start(5.0)
	

func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://Scene/EscenaDeBatalla/escena_de_batalla.tscn")


func _on_spawn_body_exited(body: Node2D) -> void:
	timer.stop()
