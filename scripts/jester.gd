extends "res://scripts/Movement.gd"

# Called when the node enters the scene tree for the first time.
func _ready():
	IDLE = "Idle"
	EAST = "Horizontal"
	WEST = "Horizontal"
	get_node("AnimationPlayer").play(IDLE)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed(ActWest):
		get_node("Sprite").flip_h = true	
	if Input.is_action_pressed(ActEast):
		get_node("Sprite").flip_h = false