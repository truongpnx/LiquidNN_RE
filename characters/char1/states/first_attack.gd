extends BobbyState
class_name BobbyAttackState

var finished: bool = false

@export var damage_object: PackedScene

func on_finish():
	finished = true
	var _node = load(damage_object.resource_path).instantiate()

func enter():
	super()
	finished = false
	animated_sprite_2d.animation_finished.connect(on_finish)
	on_finish()

func exit():
	animated_sprite_2d.animation_finished.disconnect(on_finish)

func on_jump():
	return get_next_state(StateName.Jump)

func on_dash():
	return get_next_state(StateName.Dash)

func on_direction_changed(_direction: Vector2):
	if finished:
		if parent.is_on_floor():
			return get_next_state(StateName.Idle)
		return get_next_state(StateName.Fall)

func on_attack(_delta: int):
	return get_next_state(StateName.Attack)

func on_skill_1(_delta: int):
	pass

func on_skill_2(_delta: int):
	pass

func on_skill_3(_delta: int):
	pass
