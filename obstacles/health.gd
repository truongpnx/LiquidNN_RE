extends Node
class_name Health

@export var max_value: int = 100
var value: int = 100

signal value_changed(old_value: int, new_value: int)
signal depleted

func _ready() -> void:
	reset()

func reset():
	value_changed.emit(value, max_value)
	value = max_value

func heal(amount: int):
	var new_value = min(max_value, value + amount)
	value_changed.emit(value, new_value)
	value = new_value

func drain(amount: int):
	var new_value = max(0, value - amount)
	value_changed.emit(value, new_value)
	value = new_value
	if new_value == 0:
		depleted.emit()
