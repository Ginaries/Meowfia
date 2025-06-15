extends Node

var Nombre:String
var IconSelect:Texture
var Icons:Array[Texture]=[]
var TiposRareza:Array[String]=["Comun","Poco Comun","Raro","Mitico","Legendario"]
var Rareza:String
var PosibilidadNombre:Array[String]=["Fabi","Santi","Laura"]
var SaludMax:int
var SaludActual:int
var ExpOfrecida:int
var Ataque:int
var time_atack:float

func ElegimosEnemigo():
	Nombre = PosibilidadNombre.pick_random()
	Rareza = generar_rareza_con_probabilidad()

	var multiplicador_rareza = {
		"Comun": 1.0,
		"Poco Comun": 1.3,
		"Raro": 1.6,
		"Mitico": 2.0,
		"Legendario": 3.0
	}

	var velocidad_ataque_por_rareza = {
		"Comun": 3.0,
		"Poco Comun": 2.5,
		"Raro": 2.0,
		"Mitico": 1.5,
		"Legendario": 1.0
	}

	var mult = multiplicador_rareza[Rareza]

	var nivel = PlayerStats.Nivel
	var base_salud = 80 + nivel * 25
	var base_exp = 15 + nivel * 7
	var base_ataque = 4 + nivel * 2

	SaludMax = int(base_salud * mult)
	SaludActual = SaludMax
	ExpOfrecida = int(base_exp * mult)
	Ataque = int(base_ataque * mult)
	time_atack = velocidad_ataque_por_rareza[Rareza]

	print("Rareza: " + Rareza)
	print("Nombre: " + Nombre)
	print("Salud: " + str(SaludActual))
	print("EXP: " + str(ExpOfrecida))
	print("Ataque: " + str(Ataque))
	print("Velocidad de ataque: " + str(time_atack) + " segundos")


func Atacar():
	PlayerStats.recibir_daño(Ataque)

	
func morir():
	PlayerStats.obtener_objeto_de_combate()
	PlayerStats.ganar_experiencia(ExpOfrecida)
	

func generar_rareza_con_probabilidad() -> String:
	var lista_rareza: Array = []
	for i in range(50):
		lista_rareza.append("Comun")
	for i in range(25):
		lista_rareza.append("Poco Comun")
	for i in range(15):
		lista_rareza.append("Raro")
	for i in range(8):
		lista_rareza.append("Mitico")
	for i in range(2):
		lista_rareza.append("Legendario")
	return lista_rareza.pick_random()
