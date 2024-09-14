extends Node
class_name StateMachine

@export var initial_state: State
var current_state: State

func init(parent: Character):
	for child in get_children():
		if child is State:
			child.parent = parent
	change_state(initial_state)

func change_state(state: State):
	if not state or state == current_state:
		return
	
	if current_state:
		current_state.exit()

	state.enter()
	current_state = state

func process_frame(delta: float):
	var new_state = current_state.process_frame(delta)
	if new_state:
		change_state(new_state)

func process_physics(delta: float):
	var new_state = current_state.process_physics(delta)
	if new_state:
		change_state(new_state)

func process_input(event: InputEvent):
	var new_state = current_state.process_input(event)
	if new_state:
		change_state(new_state)

func on_jump():
	change_state(current_state.on_jump())

func on_dash():
	change_state(current_state.on_dash())

func on_direction_changed(_direction: Vector2):
	change_state(current_state.on_direction_changed(_direction))

func on_attack(_delta: int):
	change_state(current_state.on_attack(_delta))

func on_skill_1(_delta: int):
	change_state(current_state.on_skill_1(_delta))

func on_skill_2(_delta: int):
	change_state(current_state.on_skill_2(_delta))

func on_skill_3(_delta: int):
	change_state(current_state.on_skill_3(_delta))
