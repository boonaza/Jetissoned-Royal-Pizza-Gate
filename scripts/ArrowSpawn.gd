extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var arrow = preload("res://scenes/Arrow.tscn")
# Called when the node enters the scene tree for the first time.
func create_arrow(var direction):
	var new_arrow = arrow.instance()
	new_arrow.position = get_parent().position + (direction * 10)#20 * get_parent().angle
	new_arrow.direction = direction
	get_parent().get_parent().add_child(new_arrow)