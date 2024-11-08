extends Area2D

var IsColliding = false
var CollidingDirection = ""

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var verticalPostiion = Input.get_axis("ui_up", "ui_down") * 5
	var horizontalPostiion = Input.get_axis("ui_left", "ui_right") * 5
	
	for body in get_overlapping_bodies():
		print(body)	

	if IsColliding:
		return
		#if ((CollidingDirection == "right" && horizontalPostiion > 0) || (CollidingDirection == "left" && horizontalPostiion < 0) || (CollidingDirection == "down" && verticalPostiion > 0) || (CollidingDirection == "up" && verticalPostiion < 0)):
		#	return
		#elif verticalPostiion != 0 || horizontalPostiion != 0:
		#	IsColliding = false
	
	#position.y += verticalPostiion
	#position.x += horizontalPostiion
	
	#if verticalPostiion < 0:
		#rotation = 0
	#elif verticalPostiion > 0:
		#rotation = 3.1415901184082
	
	#if horizontalPostiion < 0:
		#rotation = -1.57079994678497
	#elif horizontalPostiion > 0:
		#rotation = 1.57079994678497

func _on_area_entered(area: Area2D) -> void:
	pass
	#var verticalPostiion = Input.get_axis("ui_up", "ui_down") * 5
	#var horizontalPostiion = Input.get_axis("ui_left", "ui_right") * 5
	#print("colisao")
	#IsColliding = true
	#if verticalPostiion != 0:
		#CollidingDirection = "up" if verticalPostiion < 0 else "down"
	#if horizontalPostiion != 0:
		#CollidingDirection = "left" if horizontalPostiion < 0 else "right"
	#print(IsColliding)
	#print(CollidingDirection)
