extends CharacterBody2D

@export var Name:String="Comerciante"
var Speak:bool=false
var player:CharacterBody2D
@onready var label: Label = $AnimatedSprite2D/Label
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D
var speak:bool=false

func _ready() -> void:
	if Name=="Comerciante":
		animated_sprite_2d.play("idle")
	
func Hablar():
	if Speak:
		return
	Speak = true
	if NpcDialogo.CualObj==Name:
		audio_stream_player_2d.play()
		DialogueManager.show_dialogue_balloon(NpcDialogo.BdialComerciar,NpcDialogo.DialogosTuto[NpcDialogo.IndiceTuto])
		await DialogueManager.dialogue_ended
		NpcDialogo.TutoNext()
	else:
		audio_stream_player_2d.play()
		DialogueManager.show_dialogue_balloon(NpcDialogo.BdialComerciar,"Iniciar_Tradeo")
		await DialogueManager.dialogue_ended
	
	Speak = false


func _on_detectar_player_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		player=body



func _on_detectar_player_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		player=null
