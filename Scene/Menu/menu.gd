extends Control
@onready var ingrese_nombre: LineEdit = $CartelNombre/VBoxContainer/IngreseNombre
@onready var menu: Control = $"."
@onready var cartel_nombre: PanelContainer = $CartelNombre
@onready var start: Button = $VBoxContainer/Start
@onready var salir: Button = $VBoxContainer/Salir


func _ready():
	start.disabled=false
	salir.disabled=false
	# Nos aseguramos de que sea visible
	
	self.visible = true
	self.modulate.a = 0.0  # Opacidad inicial en 0

	# Creamos el tween para hacer el fade in
	var tween = create_tween()
	tween.tween_property(
		self,           # Nodo al que se aplica
		"modulate:a",   # Propiedad de opacidad
		1.0,            # Valor final (opacidad total)
		1.5             # Duración del fade in
	)

func _on_aceptar_pressed() -> void:
	if ingrese_nombre.text != null:
		PlayerStats.Nombre=ingrese_nombre.text
		print(PlayerStats.Nombre)
		get_tree().change_scene_to_file("res://Scene/Mundo1/mundo_1.tscn")





func _on_start_pressed() -> void:
	cartel_nombre.visible=true
	start.disabled=true
