extends Node2D
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var progress_bar: ProgressBar = $ProgressBar
@onready var recibe_ataque: Timer = $"Recibe ataque"
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var legendario: AudioStreamPlayer2D = $Legendario
@onready var nombre: Label = $Nombre
@onready var rareza: Label = $rareza

var EnemigoActivo:bool=false
@onready var vida: Label = $ProgressBar/Vida
var terminoeldialogo:bool=false
func _ready() -> void:
	DialogueManager.show_dialogue_balloon(preload("res://Dialogos/DialogoCombate.dialogue"),"Dialogo_Pelea")
	await DialogueManager.dialogue_ended
	terminoeldialogo=true

func _process(delta: float) -> void:
	if PlayerStats.Alimentacion==0:
		PlayerStats.reiniciarStats()
		get_tree().change_scene_to_file("res://Scene/Menu/menu.tscn")
	if !terminoeldialogo:
		return
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
	nombre.text=EnemigosStats.Nombre
	rareza.text=EnemigosStats.Rareza
	progress_bar.max_value=EnemigosStats.SaludMax
	progress_bar.value=EnemigosStats.SaludActual
	sprite_2d.texture=EnemigosStats.IconSelect
	recibe_ataque.start(EnemigosStats.time_atack)
	if EnemigosStats.Rareza=="Legendario":
		legendario.play()

func _on_atacar_pressed() -> void:
	PlayerStats.atacar_enemigo()
	if EnemigosStats.SaludActual<=0:
		recibe_ataque.stop()
		EnemigosStats.morir()
		legendario.stop()
		get_tree().change_scene_to_file("res://Scene/Mundo1/mundo_1.tscn")


func _on_recibe_ataque_timeout() -> void:
	animation_player.play("atacar")
	EnemigosStats.Atacar()
	recibe_ataque.start(EnemigosStats.time_atack)


func _on_button_pressed() -> void:
	legendario.stop()
	recibe_ataque.stop()
	get_tree().change_scene_to_file("res://Scene/Mundo1/mundo_1.tscn")
