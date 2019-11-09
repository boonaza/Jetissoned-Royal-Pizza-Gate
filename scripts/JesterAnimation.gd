extends Node

var IDLE:String = "Idle"
var NORTH:String
var SOUTH:String
var WEST:String = "Horizontal"
var EAST:String = "Horizontal"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	match PlayerVars.ismoving:
		0: #Idle
			get_node("AnimationPlayer").play(IDLE)	
		3: #East
			get_node("Sprite").flip_h = false
			get_node("AnimationPlayer").play(EAST)	
		4: #West
			get_node("Sprite").flip_h = true
			get_node("AnimationPlayer").play(WEST)	