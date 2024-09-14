extends BobbyState

@export var jump_strength = 600

func enter():
	super()
	parent.velocity.y = - jump_strength

func process_physics(delta: float):
	super(delta)
	parent.velocity += parent.get_gravity() * delta
	
	if parent.move_direction.x:
		parent.velocity.x = parent.move_direction.x * speed
	else:
		parent.velocity.x = move_toward(parent.velocity.x, 0, speed)
	
	if parent.velocity.y > 0:
		return get_next_state(StateName.Fall)
	return null

func on_dash():
	return get_next_state(StateName.Dash)
