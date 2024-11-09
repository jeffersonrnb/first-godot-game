extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$LabelPoints.text = "Points: " + str(Globals.points)
	$LabelTimer.text = "Time: " + str(Globals.time)
	if Globals.points >= Globals.WIN_POINTS:
		if !$YouWinScene.visible:
			$YouWinAudioStreamPlayer.play()
		$YouWinScene.visible = true

func _on_timer_timeout() -> void:
	if Globals.time <= 1 && !Globals.points >= Globals.WIN_POINTS:
		Globals.time = 0
		if !$GameOverScene.visible:
			$GameOverAudioStreamPlayer.play()
		$GameOverScene.visible = true
	else:
		Globals.time -= 1
