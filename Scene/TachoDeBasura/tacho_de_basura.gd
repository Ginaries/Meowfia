extends Area2D
@onready var recargado: Timer = $Recargado

var lleno:bool=true

func Buscar():
	if lleno:
		#animacion
		PlayerStats.revolver_basura()
		print(PlayerStats.inventario)
		lleno=false
		recargado.start(30.0)



func _on_recargado_timeout() -> void:
	lleno=true
