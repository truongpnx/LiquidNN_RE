extends CanvasLayer

@export var character: Character
@export var player_control: Control

const RIGHT = 1
const LEFT = -1
const IDLE = 0

func _on_player_control_attack_press() -> void:
	character.attack()

func _on_player_control_dash_press() -> void:
	character.dash()

func _on_player_control_jump_press() -> void:
	character.jump()

func _on_player_control_left_press() -> void:
	character.set_move_direction(LEFT)

func _on_player_control_left_release() -> void:
	character.set_move_direction(IDLE)

func _on_player_control_right_press() -> void:
	character.set_move_direction(RIGHT)

func _on_player_control_right_release() -> void:
	character.set_move_direction(IDLE)

func _on_player_control_skill_1() -> void:
	character.first_ability()

func _on_player_control_skill_2() -> void:
	character.second_ability()

func _on_player_control_skill_3() -> void:
	character.ult_ability()
