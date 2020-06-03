extends Node2D

var Spawn1
var Spawn2

func _ready():
	Spawn1 = get_node("enemySpawn")
	Spawn2 = get_node("enemySpawn2")
	if (Status.Spawners[1] == "alive"):
		Spawn1.init(1)
		Spawn1.spawn()
	if (Status.Spawners[2] == "alive"):
		Spawn2.init(2)
		Spawn2.spawn()
