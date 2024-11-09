extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$BackgroundStreamPlayer.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Globals.points >= Globals.WIN_POINTS || Globals.time <= 0:
		$BackgroundStreamPlayer.stop()


func _on_area_2d_1_area_entered(area: Area2D) -> void:
	pass # Replace with function body.
