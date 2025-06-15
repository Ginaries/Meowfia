extends CanvasLayer
@onready var moneda: Label = $HBoxContainer/Moneda
@onready var progress_bar: ProgressBar = $ProgressBar

func _process(delta: float) -> void:
	moneda.text=str(PlayerStats.Monedas)
	progress_bar.max_value=PlayerStats.Hambre
	progress_bar.value=PlayerStats.Alimentacion
