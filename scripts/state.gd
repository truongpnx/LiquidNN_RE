extends Node
class_name State

enum StateName {None, Idle, Walk, Jump, Dash, Fall, Land, Hit, Death, Attack}
var parent: Character
@export var next_states: Array[State] = []
@export var state_name: StateName = StateName.None

func get_next_state(next_state_name: StateName):
	for state in next_states:
		if state.state_name == next_state_name:
			return state

func _ready() -> void:
	if state_name == StateName.None:
		push_warning(name + " has state name: " + StateName.keys()[StateName.None])

func enter():
	pass
	
func exit():
	pass

func process_frame(_delta: float):
	return null

func process_physics(_delta: float):
	return null

func process_input(_event: InputEvent):
	return null

func on_jump():
	pass

func on_dash():
	pass

func on_direction_changed(_direction: Vector2):
	pass

func on_attack(_delta: int):
	pass

func on_skill_1(_delta: int):
	pass

func on_skill_2(_delta: int):
	pass

func on_skill_3(_delta: int):
	pass
