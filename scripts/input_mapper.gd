extends ControlMapper

# Input relate to physics need to be handled in this function
func _physics_process(_delta: float) -> void:
	var direction = Input.get_axis("move_left", "move_right")
	direction_changed.emit(Vector2(direction, 0))
	
	if Input.is_action_pressed("dash"):
		dash_press.emit()
	
	if Input.is_action_pressed("jump"):
		jump_press.emit()

func _process(_delta: float) -> void:
	if Input.is_action_pressed("attack"):
		attack_press.emit(_delta)
	
	if Input.is_action_pressed("skill_1"):
		skill_1_press.emit(_delta)
	
	if Input.is_action_pressed("skill_2"):
		skill_2_press.emit(_delta)
	
	if Input.is_action_pressed("skill_3"):
		skill_3_press.emit(_delta)
