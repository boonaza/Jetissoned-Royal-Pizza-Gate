extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var lp_pos = Vector2(-125,-65)
# Called when the node enters the scene tree for the first time.
func _ready():
	lp_pos = Global.Player_Position
	set_global_position(lp_pos)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
