extends Node2D
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var progress_bar: ProgressBar = $ProgressBar

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

func _on_atacar_pressed() -> void:
	#EnemigosStats.SaludActual-=PlayerStats.Ataque
	#print(EnemigosStats.SaludActual)
	Actualizar()
