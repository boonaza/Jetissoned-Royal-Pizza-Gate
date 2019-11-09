extends KinematicBody2D

const MOTION_SPEED = 50 # Pixels/second
const initial_pos = Vector2(340, 360)
var ismoving:bool = 0
var IDLE:String
var NORTH:String
var SOUTH:String
var WEST:String
var EAST:String

var ActNorth:String = "north"
var ActSouth:String = "south"
var ActWest:String = "west"
var ActEast:String = "east"

func _physics_process(_delta):
	var motion = Vector2()
	if Input.is_action_pressed(ActNorth):
		#get_node("AnimationPlayer").play("PNorth")
		motion += Vector2(0, -1)
		ismoving = 1
	if Input.is_action_pressed(ActSouth):
		#get_node("AnimationPlayer").play("PSouth")
		motion += Vector2(0, 1)
		ismoving = 1
	if Input.is_action_pressed(ActWest):
		#get_node("AnimationPlayer").play("PWest")
		motion += Vector2(-1, 0)
		ismoving = 1
	if Input.is_action_pressed(ActEast):
		#get_node("AnimationPlayer").play("PEast")
		motion += Vector2(1, 0)
		ismoving = 1
	
	if (ismoving):
		if((abs(motion.x) < abs(motion.y)) && (motion.y <= 0)):
			get_node("AnimationPlayer").play(NORTH)
		if((abs(motion.x) < abs(motion.y)) && (motion.y > 0)):
			get_node("AnimationPlayer").play(SOUTH)
		if((abs(motion.x) >= abs(motion.y)) && (motion.x >= 0)):
			get_node("AnimationPlayer").play(EAST)
		if((abs(motion.x) >= abs(motion.y)) && (motion.x < 0)):
			get_node("AnimationPlayer").play(WEST)
	
	
	if Input.is_action_just_released(ActNorth) || Input.is_action_just_released(ActSouth) \
		|| Input.is_action_just_released(ActWest) || Input.is_action_just_released(ActEast):
		get_node("AnimationPlayer").play(IDLE)
		ismoving = 0
		
	motion = motion.normalized() * MOTION_SPEED

	move_and_slide(motion)