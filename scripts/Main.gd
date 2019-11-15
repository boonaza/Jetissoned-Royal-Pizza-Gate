extends Node2D

#var player = preload("res://scenes/PlayerOverworld.tscn")
onready var POWC = find_node("PlayerOverworld",true,false)

func unpause():
	POWC.get_node("POWCamera").make_current()

func pause():
	get_tree().paused = true