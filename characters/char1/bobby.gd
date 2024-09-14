extends Character
class_name Bobby

func _ready() -> void:
	super()
	state_machine.init(self)
	
func _physics_process(delta: float) -> void:
	move_and_slide()
	state_machine.process_physics(delta)

func _process(delta: float) -> void:
	state_machine.process_frame(delta)

func _unhandled_input(event: InputEvent) -> void:
	state_machine.process_input(event)

func _on_health_depleted() -> void:
	state_machine.change_state(state_machine.current_state.get_next_state(State.StateName.Death))

func _on_health_value_changed(old_value: int, new_value: int) -> void:
	if new_value == 0:
		return

	if old_value > new_value:
		state_machine.change_state(state_machine.current_state.get_next_state(State.StateName.Hit))
