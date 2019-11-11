extends KinematicBody2D

var MOTION_SPEED = PlayerVars.Motion_Speed_OW # Pixels/second
const initial_pos = Vector2(340, 360)
var ismoving:bool = 0
onready var PlayAnim = get_node("AnimationPlayer")

func _ready():
	PlayAnim.play("PIdle")

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
			PlayAnim.play("PNorth")
		if((abs(motion.x) < abs(motion.y)) && (motion.y > 0)):
			PlayAnim.play("PSouth")
		if((abs(motion.x) >= abs(motion.y)) && (motion.x >= 0)):
			PlayAnim.play("PEast")
		if((abs(motion.x) >= abs(motion.y)) && (motion.x < 0)):
			PlayAnim.play("PWest")
	
	
	if Input.is_action_just_released("north") || Input.is_action_just_released("south") \
		|| Input.is_action_just_released("west") || Input.is_action_just_released("east"):
		
		PlayAnim.play("PIdle")
		ismoving = 0
		
	motion = motion.normalized() * MOTION_SPEED

	move_and_slide(motion)
	
func claim_item(var itemid, var itemname):
	if(itemid == 1):
		MOTION_SPEED += 0.5 * MOTION_SPEED
	print(PlayerVars.Name , " has claimed the " , itemname)
	PlayerVars.Motion_Speed_OW = MOTION_SPEED