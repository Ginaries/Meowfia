extends Node


var Nombre:String
var Hambre=100
var Chatarra:int=0
var Monedas:int = 0
var Alimentacion:int=50
var Ataque:int=2
var inventario: Dictionary = {"Lata":0, "Hueso":0, "Trapo":0, "Botella":0}
var posibles_objetos = ["Lata", "Hueso", "Trapo", "Botella"]
var objeto_pedido:String
#----------------------------------------------------------------------
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
#----------------------------------------------------------------------
