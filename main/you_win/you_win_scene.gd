extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_play_again_button_pressed() -> void:
	visible = false
	get_tree().reload_current_scene()
	Globals.time = Globals.INITIAL_TIME
	Globals.points = Globals.INITIAL_POINTS