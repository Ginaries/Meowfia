extends CharacterBody2D

@export var Name:String="Gatita Misteriosa"
var Speak:bool=false
const DIALOGO_INICIAL = preload("res://Dialogos/Dialogo Inicial.dialogue")
var player:CharacterBody2D
@onready var label: Label = $AnimatedSprite2D/Label
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
var speak:bool=false

func _ready() -> void:
	if Name=="Gatita Misteriosa":
		animated_sprite_2d.play("GatitaMisteriosa")


func Hablar():
	if speak:
		return
	speak = true
	if NpcDialogo.CualObj=="Gatita Misteriosa":
		DialogueManager.show_dialogue_balloon(NpcDialogo.BDialTuto,NpcDialogo.DialogosTuto[NpcDialogo.IndiceTuto])
		await DialogueManager.dialogue_ended
		NpcDialogo.TutoNext()
	else :
		DialogueManager.show_dialogue_balloon(preload("res://Dialogos/Gatita Misteriosa.dialogue"),"start")
	speak=false

func _on_detectar_player_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		player=body



func _on_detectar_player_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		player=null
