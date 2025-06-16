extends CharacterBody2D

@export var Name:String
var Speak:bool=false
var player:CharacterBody2D
@onready var label: Label = $AnimatedSprite2D/Label
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


func _ready() -> void:
	if Name=="Mercader":
		animated_sprite_2d.play("idle")
	label.text=Name
func Hablar():
	if NpcDialogo.CualObj==Name:
		DialogueManager.show_dialogue_balloon(NpcDialogo.BdialComerciar,NpcDialogo.DialogosTuto[NpcDialogo.IndiceTuto])
	if !NpcDialogo.CualObj==Name:
		DialogueManager.show_dialogue_balloon(NpcDialogo.BdialComerciar,"Iniciar_Tradeo")


func _on_detectar_player_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		player=body



func _on_detectar_player_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		player=null
