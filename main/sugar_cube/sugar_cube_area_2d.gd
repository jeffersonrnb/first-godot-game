extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body.name == "AntPlayer":
		Globals.points += 1
		Globals.time += 1
		change_pos()
	else:
		change_pos()

func change_pos():
	var rng = RandomNumberGenerator.new()
	var new_x = rng.randf_range(195, 830)
	var new_y = rng.randf_range(150, 630)
	position.x = new_x
	position.y = new_y
