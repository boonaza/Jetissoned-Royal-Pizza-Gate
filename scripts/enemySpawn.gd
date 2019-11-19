extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var ID = 0
var EnemyType = 1
var child = preload("res://scenes/RogueEOW.tscn")


# Called when the node enters the scene tree for the first time.
#func _ready():
#	create_child()


func spawn():
	var new_child = child.instance()
	new_child.position = Global.Enemy_Position + Vector2(Global.rng.randi() % 2,Global.rng.randi() % 2)#position + Vector2(20,1)
	add_child(new_child)
	for i in get_child_count():
		get_child(i).set_ID(ID)

func init(var id, var enemy_type = 1):
	ID = id
	EnemyType = enemy_type
	child = load("res://scenes/" + Status.EnemyList[EnemyType])
	