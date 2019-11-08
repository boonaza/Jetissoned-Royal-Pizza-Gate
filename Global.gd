extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var EscapeChance = 80
var Gold = 0

var Player_Position = Vector2(-125,-65)
var Enemy_Position = Vector2(0,0)

func Store_Position(var PlrPos,var NmyPos):
	Player_Position = -(PlrPos)
	Enemy_Position = NmyPos


# Called when the node enters the scene tree for the first time.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
