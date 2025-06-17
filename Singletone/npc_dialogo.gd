extends Node

var IndiceTuto:int=0
var BDialTuto= preload("res://Dialogos/Dialogo Inicial.dialogue")
var BdialComerciar= preload("res://Dialogos/Comerciante.dialogue")
var BdialChef= preload("res://Dialogos/Chef.dialogue")
var DialogosTuto=["Introduccion","TOCO_BASURA","Introduccion_Comerciante","Introduccion_Chef"]
var objetivoDialogo=["Gatita Misteriosa", "Comerciante", "Jefe","Tacho","Chef"]
var Objetivo:bool=true
var CualObj:String="Gatita Misteriosa"

func TutoNext():
	IndiceTuto+=1
	if IndiceTuto==1:
		CualObj=objetivoDialogo[3]
		print(CualObj)
	if IndiceTuto==2:
		CualObj=objetivoDialogo[1]
	if IndiceTuto==3:
		CualObj=objetivoDialogo[4]
	if IndiceTuto==4:
		CualObj=""

func EstablecerObjetivo(cual):
	if cual in objetivoDialogo:
		Objetivo=true
		CualObj=cual
