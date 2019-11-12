extends Node

var EscapeChance = 80
var Gold = 0
var Ready = 1
var rng = RandomNumberGenerator.new()


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
	
func Restart():
	EscapeChance = 80
	Gold = 0
	Ready = 1
	rng = RandomNumberGenerator.new()


	Player_Position = Vector2(-125,-65)
	Enemy_Position = Vector2(0,0)