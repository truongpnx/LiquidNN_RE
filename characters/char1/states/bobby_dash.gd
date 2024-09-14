extends BobbyState

@export var dash_time: float = 1.0
@export var dash_strenth: float = 1000

var dashing: bool = false

func enter():
	super()
	if not dashing:
		var dash_direcion = -1 if animated_sprite_2d.flip_h else 1
		parent.velocity = Vector2(dash_direcion * dash_strenth, 0)
		dashing = true
		
		var fall_state = get_next_state(StateName.Fall)
		if fall_state:
			fall_state.can_dash = false
		
		await get_tree().create_timer(dash_time).timeout
		dashing = false

func process_physics(_delta: float):
	if not dashing:
		if parent.is_on_floor():
			if parent.velocity.x != 0:
				return get_next_state(StateName.Walk)
			else:
				return get_next_state(StateName.Idle)
		else:
			return get_next_state(StateName.Fall)
	return null
