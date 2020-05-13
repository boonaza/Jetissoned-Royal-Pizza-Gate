extends Node

var EscapeChance = 80
var Gold = 0
var Ready = 1
var rng = RandomNumberGenerator.new()
var Current_Enemy = 1
var Enemy_Count = 0
var loading = 0
var CaptivePA = 0

var Player_Position = Vector2(100,80)
var Enemy_Position = Vector2(0,0)

func Store_Position(var PlrPos,var NmyPos):
	Player_Position = (PlrPos)
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
	
	
func Set_Player_Position(var posit):
	if (!loading):
		Player_Position = posit

func Restart():
	EscapeChance = 80
	Gold = 0
	Ready = 1
	rng = RandomNumberGenerator.new()
	Current_Enemy = 1
	Enemy_Count = 0
	CaptivePA = 0
	loading = 0
	Player_Position = Vector2(100,80)
	Enemy_Position = Vector2(0,0)