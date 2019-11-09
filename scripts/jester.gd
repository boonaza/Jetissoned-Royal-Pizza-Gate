extends "res://scripts/Movement.gd"

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	IDLE = "Idle"
	EAST = "Horizontal"
	WEST = "Horizontal"
	get_node("AnimationPlayer").play(IDLE)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
#	pass
	if Input.is_action_pressed(ActWest):
		get_node("Sprite").flip_h = true	
	if Input.is_action_pressed(ActEast):
		get_node("Sprite").flip_h = false