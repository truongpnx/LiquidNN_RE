extends CanvasLayer

@export var character: Character

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
	#if Input.is_action_pressed("attack"):
		#character.attack()
	#
	#if Input.is_action_pressed("dash"):
		#character.dash()
	#
	#if Input.is_action_pressed("skill_1"):
		#character.first_ability()
	#
	#if Input.is_action_pressed("skill_2"):
		#character.second_ability()
	#
	#if Input.is_action_pressed("skill_3"):
		#character.ult_ability()
	#
	#if Input.is_action_pressed("jump"):
		#character.jump()
	#
	#var direction = Input.get_axis("move_left", "move_right")
	#character.set_move_direction(direction)
