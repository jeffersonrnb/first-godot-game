extends Area2D

var changing_position = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	visible = !changing_position
	if changing_position:
		changing_position = false


func _on_body_entered(body: Node2D) -> void:
	if body.name == "AntPlayer":
		$SugarCubeStreamPlayer.play()
		Globals.points += 1
		Globals.time += 1
		change_pos()
	else:
		change_pos()

func change_pos():
	changing_position = true
	var rng = RandomNumberGenerator.new()
	var new_x = rng.randf_range(195, 830)
	var new_y = rng.randf_range(150, 630)
	position.x = new_x
	position.y = new_y
