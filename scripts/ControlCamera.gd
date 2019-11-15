extends Camera2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var trackee
var scene = "OW"
# Called when the node enters the scene tree for the first time.
func _process(delta):
	position = trackee.position
	if (scene == "Enc"):
		zoom = Vector2(0.09,0.09)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
