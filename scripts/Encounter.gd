extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var eneNum:int = 0
var i
var MapA = find_node("Map")
var EnemyA = preload("res://scenes/EnemyCMB.tscn")
var MenuV = preload("res://scenes/MenuVictory.tscn")
var MenuD = preload("res://scenes/MenuDefeat.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	eneNum = Global.rng.randi_range(1,3)
	print( eneNum)

func Defeat():
	get_child(0).queue_free()
	add_child(MenuD.instance())
	
	
func _unhandled_input(event):
	if Input.is_action_pressed("DebugSpawn"):
		for i in range(eneNum):
			find_node("ESpawnPos" + str(i+1)).spawn()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (Global.Enemy_Count < 1):
		add_child(MenuV.instance())
		#get_tree().change_scene("res://scenes/Main.tscn")
