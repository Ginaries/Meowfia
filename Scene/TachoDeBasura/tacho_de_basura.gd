extends Area2D
@onready var recargado: Timer = $Recargado
@onready var icon: Sprite2D = $Icon
@onready var obtencion: Label = $Obtencion
@onready var animation_player: AnimationPlayer = $AnimationPlayer

var lleno:bool=true
var icons:Array[Texture]=[preload("res://Assets/Basura/tacho_basura.png"), preload("res://Assets/Basura/tacho_basura_abierto.png")]

func _ready() -> void:
	icon.texture=icons[0]
func Buscar():
	if lleno:
		icon.texture=icons[1]
		PlayerStats.revolver_basura()
		obtencion.text=PlayerStats.obj
		animation_player.play("subir")
		lleno=false
		recargado.start(30.0)



func _on_recargado_timeout() -> void:
	lleno=true
	icon.texture=icons[0]
