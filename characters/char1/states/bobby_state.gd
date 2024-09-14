extends State
class_name BobbyState

@export var animation_name: String
@export var speed = 400
@onready var animated_sprite_2d: AnimatedSprite2D = %AnimatedSprite2D

func enter():
	animated_sprite_2d.play(animation_name)
	
func exit():
	super()

func process_frame(_delta: float):
	super(_delta)

func process_physics(_delta: float):
	super(_delta)
	var direction = parent.move_direction.x
	if direction < 0:
		animated_sprite_2d.flip_h = true
	elif direction > 0:
		animated_sprite_2d.flip_h = false

func on_direction_changed(_direction: Vector2):
	parent.move_direction = _direction

func process_input(_event: InputEvent):
	super(_event)
