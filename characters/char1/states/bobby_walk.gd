extends BobbyState

func enter():
	super()

func process_physics(delta: float):
	super(delta)

	parent.velocity.x = parent.move_direction.x * speed

	if not parent.is_on_floor():
		return get_next_state(StateName.Fall)
	return null

func on_direction_changed(_direction: Vector2):
	super(_direction)
	if abs(_direction.x) < 0.05:
		return get_next_state(StateName.Idle)

func on_jump():
	return get_next_state(StateName.Jump)

func on_attack(_delta: int):
	return get_next_state(StateName.Attack)

func on_dash():
	return get_next_state(StateName.Dash)
