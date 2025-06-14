extends CharacterBody2D

@export var Name:String
var Speak:bool=false
const DIALOGO_INICIAL = preload("res://Dialogos/Dialogo Inicial.dialogue")
var player:CharacterBody2D
@onready var label: Label = $Label


func _ready() -> void:
	label.text=Name
func Hablar():
	DialogueManager.show_dialogue_balloon(DIALOGO_INICIAL)


func _on_detectar_player_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		player=body



func _on_detectar_player_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		player=null
