extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var arrow = preload("res://scenes/Arrow.tscn")
# Called when the node enters the scene tree for the first time.
func create_arrow():
	var new_arrow = arrow.instance()
	new_arrow.position = get_parent().position + Vector2(10,0)#20 * get_parent().angle
	get_parent().get_parent().add_child(new_arrow)