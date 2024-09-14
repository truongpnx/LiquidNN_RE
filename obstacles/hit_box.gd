extends Area2D
class_name HitBox

@export var healthObject: Health

func _ready() -> void:
	area_entered.connect(_on_area_entered)

func _on_area_entered(area: Area2D) -> void:
	if area is HurtBox and healthObject:
		healthObject.drain(area.damage)
		area.on_hit()
