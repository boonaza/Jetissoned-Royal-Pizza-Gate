extends KinematicBody2D

const MOTION_SPEED = 50 # Pixels/second
const initial_pos = Vector2(340, 360)

var ActNorth:String = "north"
var ActSouth:String = "south"
var ActWest:String = "west"
var ActEast:String = "east"

func _physics_process(_delta):
	var motion = Vector2()
	if Input.is_action_pressed(ActNorth):
		motion += Vector2(0, -1)
		PlayerVars.ismoving = 1
	if Input.is_action_pressed(ActSouth):
		motion += Vector2(0, 1)
		PlayerVars.ismoving = 2
	if Input.is_action_pressed(ActWest):
		motion += Vector2(-1, 0)
		PlayerVars.ismoving = 3
	if Input.is_action_pressed(ActEast):
		motion += Vector2(1, 0)
		PlayerVars.ismoving = 4
	
	if (PlayerVars.ismoving):
		if(abs(motion.x) < abs(motion.y)):
			if (motion.y <= 0):
				PlayerVars.ismoving = 1
			else:
				PlayerVars.ismoving = 2
		else:
			if(motion.x >= 0):
				PlayerVars.ismoving = 3
			else:
				PlayerVars.ismoving = 4
	
	
	if Input.is_action_just_released(ActNorth) || Input.is_action_just_released(ActSouth) \
		|| Input.is_action_just_released(ActWest) || Input.is_action_just_released(ActEast):
		PlayerVars.ismoving = 0
		
	motion = motion.normalized() * MOTION_SPEED

	move_and_slide(motion)
