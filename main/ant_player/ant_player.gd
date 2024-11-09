extends CharacterBody2D

const JUMP_VELOCITY = -400.0
const SOUND_POSITION_LIMIT = 1.2
var SPEED = 120.0
var boost_multiplier = 10
var boost_time = null
var moving_sound_is_playing = false
var collision_sound_is_playing = false

func change_footstep_sound():
	if boost_time == null:
		$MovingStreamPlayer.stream = load("res://assets/Sounds/walking_grass.mp3")
	else:
		$MovingStreamPlayer.stream = load("res://assets/Sounds/running_grass.mp3")

func start_moving_sound():
	if get_slide_collision_count() == 0:
		collision_sound_is_playing = false

	if !$MovingStreamPlayer.playing || $MovingStreamPlayer.get_playback_position() >= SOUND_POSITION_LIMIT:
		change_footstep_sound()
		$MovingStreamPlayer.play()
		moving_sound_is_playing = true

func stop_moving_sound():
	$MovingStreamPlayer.stop()
	moving_sound_is_playing = false

func _physics_process(delta: float) -> void:
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		if !$CollisionStreamPlayer.playing && !collision_sound_is_playing:
			collision_sound_is_playing = true
			$CollisionStreamPlayer.play()
			print("Player Collided with: ", collision.get_collider().name)
	
	if Globals.points == Globals.WIN_POINTS || Globals.time == 0:
		stop_moving_sound()

	if Globals.points > 0 && Globals.points % 10 == 0 && boost_time == null:
		boost_time = Globals.time
		SPEED = Globals.BOOST_SPEED
		$AntPlayerShape/AntPlayerSprite.texture = load("res://assets/PNG_Parts&Spriter_Animation/Ant2/Ant2.png")
		change_footstep_sound()
	else:
		if boost_time != null && boost_time - Globals.time > Globals.BOOST_LIMIT:
			change_footstep_sound()
			$AntPlayerShape/AntPlayerSprite.texture = load("res://assets/PNG_Parts&Spriter_Animation/Ant1/Ant1.png")
			boost_time = null
			SPEED = Globals.NORMAL_SPEED
	
	# Get the input horizontalDirection and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var horizontalDirection := Input.get_axis("ui_left", "ui_right")
	if horizontalDirection:
		start_moving_sound()
		velocity.x = horizontalDirection * SPEED

		if horizontalDirection == 1:
			rotation = 0
		else:
			rotation = -3.1415901184082
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	var verticalDirection := Input.get_axis("ui_up", "ui_down")
	if verticalDirection:
		start_moving_sound()
		velocity.y = verticalDirection * SPEED

		if verticalDirection == 1:
			rotation = 1.57079994678497
		else:
			rotation = -1.57079994678497
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)

	if (!Input.is_action_pressed("ui_up") && !Input.is_action_pressed("ui_down") && !Input.is_action_pressed("ui_left") && !Input.is_action_pressed("ui_right")):
		stop_moving_sound()

	move_and_slide()
