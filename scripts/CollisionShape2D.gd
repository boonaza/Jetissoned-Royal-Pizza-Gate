extends CollisionShape2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
var arrow = preload("res://scenes/Arrow.tscn")
# Called when the node enters the scene tree for the first time.
func create_arrow():
	var new_arrow = arrow.instance()
	new_arrow.position = get_parent().position + Vector2(20,1)
	get_parent().get_parent().add_child(new_arrow)s the elapsed time since the previous frame.
#func _process(delta):
#	pass
