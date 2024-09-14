extends Control
class_name Loading

@onready var progress_bar: ProgressBar = %ProgressBar

var _scene_name: String
var _scene_load_status = -1
var _progress = []

func _ready() -> void:
	_scene_name = GameController.next_scene.resource_path
	ResourceLoader.load_threaded_request(_scene_name)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	_scene_load_status = ResourceLoader.load_threaded_get_status(_scene_name, _progress)
	progress_bar.value = floor(_progress[0]*100)
	if _scene_load_status == ResourceLoader.THREAD_LOAD_LOADED:
		var packed_scene = ResourceLoader.load_threaded_get(_scene_name)
		get_tree().change_scene_to_packed(packed_scene)
	
	
