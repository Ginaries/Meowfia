extends Node2D
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var progress_bar: ProgressBar = $ProgressBar


func _process(delta: float) -> void:
	progress_bar.value=EnemigosStats.SaludActual
	
func Actualizar():
	EnemigosStats.ElegimosEnemigo()
	progress_bar.max_value=EnemigosStats.SaludMax
	progress_bar.value=EnemigosStats.SaludActual
	sprite_2d.texture=EnemigosStats.IconSelect

func _on_atacar_pressed() -> void:
	pass
