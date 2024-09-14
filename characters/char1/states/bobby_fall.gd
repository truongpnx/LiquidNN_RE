extends BobbyState

@export var land_state: State
@export var dash_state: State

var can_dash = true

func process_physics(_delta: float):
	super(_delta)
	parent.velocity += parent.get_gravity() * _delta
	
	if parent.move_direction.x:
		parent.velocity.x = parent.move_direction.x * speed
	else:
		parent.velocity.x = move_toward(parent.velocity.x, 0, speed)
	
	if parent.is_on_floor():
		can_dash = true
		return get_next_state(StateName.Land)
	return null

func on_dash():
	if can_dash:
		can_dash = false
		return get_next_state(StateName.Dash)
