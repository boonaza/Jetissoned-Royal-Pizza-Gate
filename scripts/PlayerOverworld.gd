extends KinematicBody2D

const MOTION_SPEED = 50 # Pixels/second
const initial_pos = Vector2(340, 360)

func _physics_process(_delta):
	var motion = Vector2()
	#get_node("AnimationPlayer").play("PIdle")
	if Input.is_action_pressed("north"):
		get_node("AnimationPlayer").play("PNorth")
		motion += Vector2(0, -1)
	if Input.is_action_pressed("south"):
		get_node("AnimationPlayer").play("PSouth")
		motion += Vector2(0, 1)
	if Input.is_action_pressed("west"):
		get_node("AnimationPlayer").play("PWest")
		motion += Vector2(-1, 0)
	if Input.is_action_pressed("east"):
		get_node("AnimationPlayer").play("PEast")
		motion += Vector2(1, 0)
	if Input.is_action_just_released("north"):
		get_node("AnimationPlayer").play("PIdle")
		
	
	motion = motion.normalized() * MOTION_SPEED

	move_and_slide(motion)