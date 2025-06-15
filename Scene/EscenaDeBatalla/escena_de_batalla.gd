extends Node2D
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var progress_bar: ProgressBar = $ProgressBar
@onready var recibe_ataque: Timer = $"Recibe ataque"

var EnemigoActivo:bool=false
@onready var vida: Label = $ProgressBar/Vida


func _process(delta: float) -> void:
	if EnemigoActivo==true:
		progress_bar.value=EnemigosStats.SaludActual
		vida.text=str(EnemigosStats.SaludActual)+"/"+str(EnemigosStats.SaludMax)
		return
	else:
		Actualizar()
	
func Actualizar():
	EnemigoActivo=true
	EnemigosStats.ElegimosEnemigo()
	vida.text=str(EnemigosStats.SaludActual)+"/"+str(EnemigosStats.SaludMax)
	progress_bar.max_value=EnemigosStats.SaludMax
	progress_bar.value=EnemigosStats.SaludActual
	sprite_2d.texture=EnemigosStats.IconSelect
	recibe_ataque.start(EnemigosStats.time_atack)

func _on_atacar_pressed() -> void:
	PlayerStats.atacar_enemigo()
	if EnemigosStats.SaludActual<=0:
		recibe_ataque.stop()
		EnemigosStats.morir()
		get_tree().change_scene_to_file("res://Scene/Mundo1/mundo_1.tscn")


func _on_recibe_ataque_timeout() -> void:
	EnemigosStats.Atacar()
	recibe_ataque.start(EnemigosStats.time_atack)
