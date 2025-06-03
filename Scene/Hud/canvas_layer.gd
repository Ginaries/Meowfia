extends CanvasLayer
@onready var moneda: Label = $HBoxContainer/Moneda

func _process(delta: float) -> void:
	moneda.text=str(PlayerStats.Monedas)
