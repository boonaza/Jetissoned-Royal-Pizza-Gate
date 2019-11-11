extends KinematicBody2D

const MOTION_SPEED = 50 # Pixels/second
const initial_pos = Vector2(340, 360)
var ismoving:bool = 0

func _ready():
	get_node("AnimationPlayer").play("PIdle")

func _physics_process(_delta):
	var motion = Vector2()
	if Input.is_action_pressed("north"):
		#get_node("AnimationPlayer").play("PNorth")
		motion += Vector2(0, -1)
		ismoving = 1
	if Input.is_action_pressed("south"):
		#get_node("AnimationPlayer").play("PSouth")
		motion += Vector2(0, 1)
		ismoving = 1
	if Input.is_action_pressed("west"):
		#get_node("AnimationPlayer").play("PWest")
		motion += Vector2(-1, 0)
		ismoving = 1
	if Input.is_action_pressed("east"):
		#get_node("AnimationPlayer").play("PEast")
		motion += Vector2(1, 0)
		ismoving = 1
	
	if (ismoving):
		if((abs(motion.x) < abs(motion.y)) && (motion.y <= 0)):
			get_node("AnimationPlayer").play("PNorth")
		if((abs(motion.x) < abs(motion.y)) && (motion.y > 0)):
			get_node("AnimationPlayer").play("PSouth")
		if((abs(motion.x) >= abs(motion.y)) && (motion.x >= 0)):
			get_node("AnimationPlayer").play("PEast")
		if((abs(motion.x) >= abs(motion.y)) && (motion.x < 0)):
			get_node("AnimationPlayer").play("PWest")
	
	
	if Input.is_action_just_released("north") || Input.is_action_just_released("south") \
		|| Input.is_action_just_released("west") || Input.is_action_just_released("east"):
		
		get_node("AnimationPlayer").play("PIdle")
		ismoving = 0
		
	motion = motion.normalized() * MOTION_SPEED

	move_and_slide(motion)