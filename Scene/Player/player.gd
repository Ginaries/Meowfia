extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var npc_cercano
var Hablando:bool=false

func _ready() -> void:
	DialogueManager.connect("dialogue_ended", Callable(self, "_on_dialogo_terminado"))

func _on_dialogo_terminado(_resource):
	Hablando = false


func _physics_process(delta: float) -> void:
	var input_vector := Vector2(
		Input.get_axis("izq", "der"),
		Input.get_axis("arriba", "abajo")
	).normalized()

	velocity = input_vector * SPEED

	move_and_slide()

	
func _input(event):
	if event.is_action_pressed("Interactuar") and npc_cercano != null and !Hablando:
		npc_cercano.Hablar()
		Hablando = true


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
