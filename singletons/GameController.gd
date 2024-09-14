extends Node

var loading_scene: String = "res://UI/loading/loading.tscn"
var next_scene: PackedScene

func change_scene(scene: PackedScene):
	self.next_scene = scene
	get_tree().change_scene_to_packed(load(loading_scene))

func quit():
	get_tree().quit()
