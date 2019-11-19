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

#func _ready():
	#if (Global.Current_Enemy != 0):
	#	init()
	#get_node("EncounterCamera").current = false
#	eneNum = Global.rng.randi_range(1,3)
#	print(eneNum)
#	for i in range(eneNum):
#		find_node("ESpawnPos" + str(i+1)).spawn()

func init(var EnemyEncountered = EnemyA):
	eneNum = Global.rng.randi_range(1,3)
	print(eneNum)
	find_node("EncounterCamera").make_current()
	print(find_node("EncounterCamera").current)
	for i in range(eneNum):
		find_node("ESpawnPos" + str(i+1)).init(EnemyEncountered.TrueID)
		find_node("ESpawnPos" + str(i+1)).spawn()
	
func Defeat():
	get_child(0).queue_free()
	add_child(MenuD.instance())
	
	
func _unhandled_input(event):
	if Input.is_action_pressed("DebugSpawn"):
		for i in range(eneNum):
			find_node("ESpawnPos" + str(i+1)).spawn()
	#if Input.is_action_pressed("DebugZoom"):
	#	get_node("EncounterCamera").make_current()
	#	get_node("EncounterCamera").zoom = Vector2(0.1,0.1)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (Global.Enemy_Count < 1):
		add_child(MenuV.instance())
		#get_tree().change_scene("res://scenes/Main.tscn")

func returnOW():
	get_tree().get_root().get_node("Control").returnOverworld(1)
	queue_free()