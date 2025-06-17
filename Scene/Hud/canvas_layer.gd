extends CanvasLayer
@onready var moneda: Label = $HBoxContainer/Moneda
@onready var progress_bar: ProgressBar = $ProgressBar
@onready var lata: Label = $VBoxContainer/HBoxContainer/Lata
@onready var hueso: Label = $VBoxContainer/HBoxContainer2/Hueso
@onready var trapo: Label = $VBoxContainer/HBoxContainer3/Trapo
@onready var botella: Label = $VBoxContainer/HBoxContainer4/Botella
@onready var garra: Label = $VBoxContainer/HBoxContainer5/Garra
@onready var colmillo: Label = $VBoxContainer/HBoxContainer6/Colmillo
@onready var escama: Label = $VBoxContainer/HBoxContainer7/Escama
@onready var cristal_oscuro: Label = $"VBoxContainer/HBoxContainer8/Cristal Oscuro"
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _process(_delta: float) -> void:
	moneda.text=str(PlayerStats.Monedas)
	progress_bar.max_value=PlayerStats.Hambre
	progress_bar.value=PlayerStats.Alimentacion
	lata.text="x"+ str(PlayerStats.inventario["Lata"])
	hueso.text="x"+ str(PlayerStats.inventario["Hueso"])
	trapo.text="x"+ str(PlayerStats.inventario["Trapo"])
	botella.text="x"+ str(PlayerStats.inventario["Botella"])
	garra.text="x"+ str(PlayerStats.inventario["Garra"])
	colmillo.text="x"+ str(PlayerStats.inventario["Colmillo"])
	escama.text="x"+ str(PlayerStats.inventario["Escama"])
	cristal_oscuro.text="x"+ str(PlayerStats.inventario["Cristal oscuro"])
	if Input.is_action_just_pressed("Inventario"):
		animation_player.play("Mostrar")
