extends Node

var IndiceTuto:int=0
var BDialTuto= preload("res://Dialogos/Dialogo Inicial.dialogue")
var BdialComerciar= preload("res://Dialogos/Comerciante.dialogue")
var DialogosTuto=["Introduccion","TOCO_BASURA","Introduccion_Comerciante"]
var objetivoDialogo=["Gatita Misteriosa", "Comerciante", "Jefe"]
var Objetivo:bool=true
var CualObj:String="Gatita Misteriosa"

func TutoNext():
	IndiceTuto+=1
	if IndiceTuto==2:
		CualObj=objetivoDialogo[1]

func EstablecerObjetivo(cual):
	if cual in objetivoDialogo:
		Objetivo=true
		CualObj=cual
