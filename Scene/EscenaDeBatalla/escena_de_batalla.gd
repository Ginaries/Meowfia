extends Node2D
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var progress_bar: ProgressBar = $ProgressBar
@onready var recibe_ataque: Timer = $"Recibe ataque"
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var legendario: AudioStreamPlayer2D = $Legendario
@onready var nombre: Label = $Nombre
@onready var rareza: Label = $rareza
@onready var cartel: Panel = $CARTEL
@onready var mensaje: RichTextLabel = $CARTEL/MENSAJE


var EnemigoActivo:bool=false
@onready var vida: Label = $ProgressBar/Vida
var terminoeldialogo:bool=false
func _ready() -> void:
	DialogueManager.show_dialogue_balloon(preload("res://Dialogos/DialogoCombate.dialogue"),"Dialogo_Pelea")
	await DialogueManager.dialogue_ended
	terminoeldialogo=true

func _process(delta: float) -> void:
	if PlayerStats.Alimentacion<=0:
		PlayerStats.reiniciarStats()
		mensaje.text = "[center][b][color=red]¡Has sido derrotado![/color][/b]\nTus fuerzas han caído en el combate...\nEl enemigo ha vencido y deberás comenzar de nuevo.\n\n[i]A veces, perder es parte del camino.[/i][/center]"
		cartel.visible = true
		recibe_ataque.stop()
		await get_tree().create_timer(3.5).timeout
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
		mensaje.text = "[center][b]¡Victoria![/b]\nHas derrotado a [color=orange]" + EnemigosStats.Nombre + "[/color].\n\nObtienes: [color=yellow]" + PlayerStats.obj + "[/color]\nExp: [color=green]" + str(EnemigosStats.ExpOfrecida) + "[/color][/center]"
		cartel.visible = true
		await get_tree().create_timer(3.5).timeout
		legendario.stop()
		get_tree().change_scene_to_file("res://Scene/Mundo1/mundo_1.tscn")


func _on_recibe_ataque_timeout() -> void:
	animation_player.play("atacar")
	EnemigosStats.Atacar()
	recibe_ataque.start(EnemigosStats.time_atack)


func _on_button_pressed() -> void:
	legendario.stop()
	recibe_ataque.stop()
	mensaje.text = "[center][b][color=orange]¡Has huido del combate![/color][/b]\nHas evitado la derrota... por ahora.\nPero no todo se gana sin luchar.[/center]"
	cartel.visible = true
	await get_tree().create_timer(3.5).timeout
	get_tree().change_scene_to_file("res://Scene/Mundo1/mundo_1.tscn")
