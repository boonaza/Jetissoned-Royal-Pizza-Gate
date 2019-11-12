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
	eneNum = Global.rng.randi_range(0,3)
	

func Defeat():
	get_child(0).queue_free()
	add_child(MenuD.instance())
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (!(has_node("Map/EnemyCMB/Sprite"))):
		add_child(MenuV.instance())
		#get_tree().change_scene("res://scenes/Main.tscn")
