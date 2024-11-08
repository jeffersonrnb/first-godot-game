extends CharacterBody2D

var SPEED = 120.0
const JUMP_VELOCITY = -400.0
var points = 0
var boost_multiplier = 10
var boost_time = null

func _physics_process(delta: float) -> void:
	if Globals.points > 0 && Globals.points % 10 == 0 && boost_time == null:
		boost_time = Globals.time
		SPEED = 150.0
		$AntPlayerShape/AntPlayerSprite.texture = load("res://assets/PNG_Parts&Spriter_Animation/Ant2/Ant2.png")
	else:
		if boost_time != null && boost_time - Globals.time > Globals.BOOST_LIMIT:
			$AntPlayerShape/AntPlayerSprite.texture = load("res://assets/PNG_Parts&Spriter_Animation/Ant1/Ant1.png")
			boost_time = null
			SPEED = 120.0
	
	# Get the input horizontalDirection and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var horizontalDirection := Input.get_axis("ui_left", "ui_right")
	if horizontalDirection:
		velocity.x = horizontalDirection * SPEED
		
		if horizontalDirection == 1:
			rotation = 0
		else:
			rotation = -3.1415901184082
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	var verticalDirection := Input.get_axis("ui_up", "ui_down")
	if verticalDirection:
		velocity.y = verticalDirection * SPEED
		if verticalDirection == 1:
			rotation = 1.57079994678497
		else:
			rotation = -1.57079994678497
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()
