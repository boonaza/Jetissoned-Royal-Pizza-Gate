
extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var player = preload("res://scenes/PlayerOverworld.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	create_player()

func create_player():
	var new_player = player.instance()
	new_player.position = Global.Player_Position #position + Vector2(20,1)
	new_player.name = "PlayerOverworld"
	add_child(new_player)
