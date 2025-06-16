extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var npc_cercano
var Basurero_cerca
var Hablando:bool=false
var Basurero:bool=false
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var flecha_objetivo: Sprite2D = $FlechaObjetivo
@onready var ListaDeNPC:Dictionary[String,Node2D]={"Gatita Misteriosa":$"../Gatita Misteriosa","Comerciante":$"../Mercader"}
@export var NPCObj:Node2D

func _ready() -> void:
	flecha_objetivo.visible=false
	DialogueManager.connect("dialogue_ended", Callable(self, "_on_dialogo_terminado"))
	global_position = PlayerStats.ultima_posicion


func _on_dialogo_terminado(_resource):
	Hablando = false


func _physics_process(_delta: float) -> void:
	
	if Hablando:
		$AnimatedSprite2D.play("Idle")  # o detener animación si querés
		return
		# Si hay un objetivo válido definido
	if NpcDialogo.Objetivo and ListaDeNPC.has(NpcDialogo.CualObj):
		NPCObj = ListaDeNPC[NpcDialogo.CualObj]

		if NPCObj and is_instance_valid(NPCObj):
			flecha_objetivo.visible = true

			var direccion = NPCObj.global_position - global_position
			flecha_objetivo.rotation = direccion.angle() - deg_to_rad(270)

			# Opcional: Si está cerca del NPC, ocultar la flecha
			if global_position.distance_to(NPCObj.global_position) < 50:
				flecha_objetivo.visible = false
		else:
			flecha_objetivo.visible = false
	else:
		flecha_objetivo.visible = false
		
	var input_vector := Vector2(
		Input.get_axis("izq", "der"),
		Input.get_axis("arriba", "abajo")
	).normalized()

	velocity = input_vector * SPEED
	move_and_slide()

	if input_vector != Vector2.ZERO:
		if abs(input_vector.x) > abs(input_vector.y):
			# Movimiento horizontal
			$AnimatedSprite2D.play("Der")
			$AnimatedSprite2D.flip_h = input_vector.x < 0  # Flip si va a la izquierda
		else:
			# Movimiento vertical
			if input_vector.y > 0:
				$AnimatedSprite2D.play("Frente")
			else:
				$AnimatedSprite2D.play("Atras")
	else:
		$AnimatedSprite2D.play("Idle")
	
	PlayerStats.ultima_posicion=global_position

	
func _input(event):
	if event.is_action_pressed("Interactuar") and npc_cercano != null and !Hablando:
		npc_cercano.Hablar()
		Hablando = true
	if event.is_action_pressed("Interactuar") and Basurero and Basurero_cerca!=null:
		print(Basurero_cerca)
		Basurero_cerca.Buscar()


func Interactuar() -> bool:
	if Input.is_action_just_pressed("Interactuar"):
		return true
	return false


func _on_dialogar_body_entered(body: Node2D) -> void:
	if body.is_in_group("npc"):
		npc_cercano = body


func _on_dialogar_body_exited(body: Node2D) -> void:
	if body == npc_cercano:
		npc_cercano = null


func _on_detector_basura_area_entered(area: Area2D) -> void:
	print("encontre basura")
	Basurero=true
	Basurero_cerca=area
