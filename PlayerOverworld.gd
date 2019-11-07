extends KinematicBody2D

const MOTION_SPEED = 50 # Pixels/second
const initial_pos = Vector2(340, 360)

func _physics_process(_delta):
	var motion = Vector2()
	
	if Input.is_action_pressed("north"):
		motion += Vector2(0, -1)
	if Input.is_action_pressed("south"):
		motion += Vector2(0, 1)
	if Input.is_action_pressed("west"):
		motion += Vector2(-1, 0)
	if Input.is_action_pressed("east"):
		motion += Vector2(1, 0)
	
	motion = motion.normalized() * MOTION_SPEED

	move_and_slide(motion)