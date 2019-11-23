extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var player = preload("res://scenes/PlayerOverworld.tscn")
onready var POWC = find_node("PlayerOverworld",true,false)
var plrspawn = Vector2(100,80)
# Called when the node enters the scene tree for the first time.
#func _ready():
#	create_player()
		
#func create_player():
#	var new_player = player.instance()
#	new_player.position = Vector2(100,30) #position + Vector2(20,1)
#	add_child(new_player)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func unpause():
	POWC.get_node("POWCamera").make_current()

func pause():
	#POWC.get_node("POWCamera").current = false
	#print(POWC.get_node("POWCamera").current)
	get_tree().paused = true