extends Node

var Nombre:String
var IconSelect:Texture
var Icons:Array[Texture]=[]
var TiposRareza:Array[String]=["Comun","Poco Comun","Raro","Mitico","Legendario"]
var Rareza:String
var PosibilidadNombre:Array[String]=["Michi1","Michi2","Michi3"]
var SaludMax:int
var SaludActual:int
var ExpOfrecida:int
func ElegimosEnemigo():
	Rareza=TiposRareza.pick_random()
	Nombre=PosibilidadNombre.pick_random()
	SaludMax=randi_range(100,1500)
	SaludActual=SaludMax
	ExpOfrecida=randi_range(10,150)
	print("rareza: " +Rareza+"Nombre "+Nombre+"Salud: "+str()"Experiencia "+ExpOfrecida)
