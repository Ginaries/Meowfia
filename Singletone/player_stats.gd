extends Node


var Nombre:String
var Nivel:int=1
var Hambre=100
var Monedas:int = 0
var Alimentacion:int=50
var Ataque:int=2
var Experiencia:int=0
var SiguienteNivelEn:int=100
var inventario: Dictionary = {
	"Lata": 0, "Hueso": 0, "Trapo": 0, "Botella": 0,
	"Garra": 0, "Colmillo": 0, "Escama": 0, "Cristal oscuro": 0
}

var posibles_objetos = ["Lata", "Hueso", "Trapo", "Botella"]  # Solo para recolección
var objetos_de_combate = ["Garra", "Colmillo", "Escama", "Cristal oscuro"]

var objeto_pedido:String
#---------------------INVENTARIO-------------------------------------------------
func agregar_a_inventario(nombre_objeto: String):
	if inventario.has(nombre_objeto):
		inventario[nombre_objeto] += 1
	else:
		inventario[nombre_objeto] = 1

func revolver_basura():
	var obj = posibles_objetos.pick_random()
	agregar_a_inventario(obj)

func tiene_objeto_pedido() -> bool:
	return inventario.get(objeto_pedido, 0) > 0

func entregar_objeto():
	if tiene_objeto_pedido():
		inventario[objeto_pedido] -= 1
		Monedas += 1

func obtener_objeto_de_combate():
	var obj = objetos_de_combate.pick_random()
	agregar_a_inventario(obj)

#----------------------------------------------------------------------
#---------------------EXPERIENCIA Y SUBIDA DE NIVEL-------------------------------------

func ganar_experiencia(cantidad: int):
	Experiencia += cantidad
	while Experiencia >= SiguienteNivelEn:
		subir_de_nivel()

func subir_de_nivel():
	Experiencia -= SiguienteNivelEn
	Nivel += 1
	SiguienteNivelEn = int(SiguienteNivelEn * 1.5)
	# Subida automática de estadísticas básicas
	Ataque += 1
	Alimentacion += 2

#---------------------COMBATE Y LOOT DE ENEMIGOS-------------------------------------

func recibir_daño(cantidad: int):
	Hambre = max(0, Hambre - cantidad)

func atacar_enemigo(enemigo):
	enemigo.recibir_daño(Ataque)

func derrotar_enemigo(exp:int=EnemigosStats.ExpOfrecida):
	ganar_experiencia(exp)
	obtener_objeto_de_combate()
	Monedas += randi_range(1, 3)
#--------------------SALUDRECARGA------------------------
func Curar(cuanto:int) -> void:
	var Cuantocurar=cuanto
	while Cuantocurar>0:
		Alimentacion += 1
		Cuantocurar-=1
		print("Debug: Alimentacion =", Alimentacion)
		await get_tree().create_timer(0.05).timeout
