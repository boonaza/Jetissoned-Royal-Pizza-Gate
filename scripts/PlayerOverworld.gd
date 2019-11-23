extends KinematicBody2D

var MOTION_SPEED = PlayerVars.Motion_Speed_OW # Pixels/second
const initial_pos = Vector2(340, 360)
var ismoving:bool = 0
onready var PlayAnim = get_node("AnimationPlayer")

var ActNorth:String = "north"
var ActSouth:String = "south"
var ActWest:String = "west"
var ActEast:String = "east"

func _ready():
	PlayAnim.play("PIdle")
	Global.loading = 0

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
	Global.Set_Player_Position(position)
	
func claim_item(var itemid, var itemname):
	if(itemid == 1):
		MOTION_SPEED += 0.5 * MOTION_SPEED
	print(PlayerVars.Name , " has claimed the " , itemname)
	PlayerVars.Motion_Speed_OW = MOTION_SPEED
	