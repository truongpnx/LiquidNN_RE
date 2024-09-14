extends BobbyState

@export var idle_state: State
@export var walk_state: State

@export var land_time = 0.25

var time_out: bool = false
var is_move = false

func enter():
	super()
	time_out = false
	is_move = false
	await get_tree().create_timer(land_time).timeout
	time_out = true

func process_physics(_delta: float):
	if time_out:
		if abs(parent.move_direction.x) < 0.05:
			return get_next_state(StateName.Idle)
		return get_next_state(StateName.Walk)
	return

func on_direction_changed(_direction: Vector2):
	if time_out:
		if abs(_direction.x) < 0.05:
			return get_next_state(StateName.Idle)
		return get_next_state(StateName.Walk)
	return
