extends CharacterBody2D

@export var Name:String
var Speak:bool=false
const DIALOGO_INICIAL = preload("res://Dialogos/Dialogo Inicial.dialogue")
var player:CharacterBody2D
@onready var label: Label = $AnimatedSprite2D/Label
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


func _ready() -> void:
	if Name=="Gatita Misteriosa":
		animated_sprite_2d.play("GatitaMisteriosa")
	else:
		animated_sprite_2d.play("default")
	label.text=Name
func Hablar():
	DialogueManager.show_dialogue_balloon(NpcDialogo.BDialTuto,NpcDialogo.DialogosTuto[NpcDialogo.IndiceTuto])
	await DialogueManager.dialogue_ended
	NpcDialogo.TutoNext()


func _on_detectar_player_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		player=body



func _on_detectar_player_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		player=null
