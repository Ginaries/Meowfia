extends Node

var IndiceTuto:int=0
var BDialTuto= preload("res://Dialogos/Dialogo Inicial.dialogue")
var DialogosTuto=["Introduccion","Tutorial_Barra_de_Hambre","Tutorial_Movimiento","Fin_Movimiento","Tutorial_Interaccion","Fin_Interaccion"]

func TutoNext():
	IndiceTuto+=1
