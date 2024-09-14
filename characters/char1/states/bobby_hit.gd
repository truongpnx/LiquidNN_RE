extends BobbyState

@export var hit_box_shape: CollisionShape2D

var end_anim = false
var pre_collision_mask

func enter():
	super()
	
	parent.velocity = Vector2.ZERO
	end_anim = false
	pre_collision_mask = parent.collision_mask
	hit_box_shape.call_deferred("set_disabled", true)
	
	await animated_sprite_2d.animation_finished
	end_anim = true

func process_physics(_delta):
	if end_anim:
		if parent.is_on_floor():
			return get_next_state(StateName.Idle)
		return get_next_state(StateName.Fall)

func exit():
	hit_box_shape.call_deferred("set_disabled", false)
