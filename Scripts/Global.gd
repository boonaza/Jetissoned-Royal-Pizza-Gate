extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

#Options:

var zoom = Vector2(0.3,0.3)

#Character Stats:
var EscapeChance = 80
var Gold = 0
var Ready = 1

var Player_Position = Vector2(-125,-65)
var Enemy_Position = Vector2(0,0)

func Store_Position(var PlrPos,var NmyPos):
	Player_Position = -(PlrPos)
	Enemy_Position = NmyPos

func daze(var NumTurns):
	Ready = 0
	var t = Timer.new()
	t.set_wait_time(NumTurns)
	t.set_one_shot(true)
	self.add_child(t)
	t.start()
	yield(t, "timeout")
	Ready = 1
	t.queue_free()

# Called when the node enters the scene tree for the first time.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
