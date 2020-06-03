extends "MovementAnimation.gd"


#Sets animation variables
func _ready():
	IDLE = "Idle"
	WEST = "Horizontal"
	EAST = "Horizontal"

func _process(delta):
	#Set animation
	setAnimation(PlayerVars.ismoving, get_node("AnimationPlayer"))
	
	#If needed, flip sprite
	match PlayerVars.ismoving:
		3: #East
			get_node("Sprite").flip_h = false
		4: #West
			get_node("Sprite").flip_h = true
