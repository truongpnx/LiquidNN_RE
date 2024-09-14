extends Control

@export var play_scene: PackedScene

func _on_play_pressed() -> void:
	GameController.change_scene(play_scene)


func _on_settings_pressed() -> void:
	pass # Replace with function body.


func _on_quit_pressed() -> void:
	GameController.quit()
