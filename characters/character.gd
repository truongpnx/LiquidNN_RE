extends CharacterBody2D
class_name Character

var move_direction: Vector2 = Vector2.ZERO
@export var isAlive = true :
	set(value):
		isAlive = value
		alive_changed.emit(value)
		
@export var control_mapper: ControlMapper
@export var state_machine: StateMachine

signal alive_changed(alive: bool)

func _ready() -> void:
	if not control_mapper:
		push_error("Character need a control")
		return
	connect_control()

func _exit_tree() -> void:
	disconnect_control()

func connect_control():
	control_mapper.attack_press.connect(state_machine.on_attack)
	control_mapper.dash_press.connect(state_machine.on_dash)
	control_mapper.direction_changed.connect(state_machine.on_direction_changed)
	control_mapper.jump_press.connect(state_machine.on_jump)
	control_mapper.skill_1_press.connect(state_machine.on_skill_1)
	control_mapper.skill_2_press.connect(state_machine.on_skill_2)
	control_mapper.skill_3_press.connect(state_machine.on_skill_3)
	
func disconnect_control():
	control_mapper.attack_press.disconnect(state_machine.on_attack)
	control_mapper.dash_press.disconnect(state_machine.on_dash)
	control_mapper.direction_changed.disconnect(state_machine.on_direction_changed)
	control_mapper.jump_press.disconnect(state_machine.on_jump)
	control_mapper.skill_1_press.disconnect(state_machine.on_skill_1)
	control_mapper.skill_2_press.disconnect(state_machine.on_skill_2)
	control_mapper.skill_3_press.disconnect(state_machine.on_skill_3)
