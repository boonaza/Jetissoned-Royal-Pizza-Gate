extends Node2D

var lp_pos = Vector2(-125,-65)

func _ready():
	lp_pos = Global.Player_Position
	set_global_position(lp_pos)