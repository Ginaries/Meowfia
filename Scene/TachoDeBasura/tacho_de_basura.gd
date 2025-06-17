extends Area2D
@onready var recargado: Timer = $Recargado
@onready var icon: Sprite2D = $Icon
@onready var obtencion: Label = $Obtencion
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D
var player:CharacterBody2D
var lleno:bool=true
var icons:Array[Texture]=[preload("res://Assets/Basura/tacho_basura.png"), preload("res://Assets/Basura/tacho_basura_abierto.png")]

func _ready() -> void:
	icon.texture=icons[0]
func Buscar():
	if lleno:
		audio_stream_player_2d.play()
		icon.texture=icons[1]
		PlayerStats.revolver_basura()
		obtencion.text=PlayerStats.obj
		animation_player.play("subir")
		lleno=false
		recargado.start(30.0)

func Hablar():
	if NpcDialogo.CualObj=="Tacho":
		DialogueManager.show_dialogue_balloon(NpcDialogo.BDialTuto,NpcDialogo.DialogosTuto[NpcDialogo.IndiceTuto])
		await DialogueManager.dialogue_ended
		NpcDialogo.TutoNext()
	else:
		return

func _on_recargado_timeout() -> void:
	lleno=true
	icon.texture=icons[0]


func _on_detectar_player_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		player=body



func _on_detectar_player_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		player=null
