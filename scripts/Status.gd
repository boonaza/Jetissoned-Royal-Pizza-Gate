extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
#var Spawn1 = "alive"
var Spawners = ["alive","alive","alive", "alive"]

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func kill(var index):
	Spawners[index] = "dead"
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func Restart():
	Spawners = ["alive", "alive", "alive"]
