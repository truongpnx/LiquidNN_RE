extends Area2D
class_name HurtBox

@export var damage = 0
@export var parent: Node

func on_hit():
	parent.queue_free()
