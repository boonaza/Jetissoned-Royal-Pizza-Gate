extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
#var Spawn1 = "alive"
var Spawners:Array = ["alive"]
const EnemyList:Array = ["RogueEOW.tscn", "RogueEOW.tscn", "AntiRogue.tscn"]
const CMBList:Array = ["RogueECMB.tscn", "RogueECMB.tscn" , "AntirogueECMB.tscn"]
# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(1,64):
		Spawners.push_back("alive")
	pass # Replace with function body.

func kill(var index):
	Spawners[index] = "dead"
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func enemyfilepath(var Index):
	return EnemyList[Index]

func Restart():
	
	Spawners = ["alive"]
	for i in range(1,64):
		Spawners.push_back("alive")


