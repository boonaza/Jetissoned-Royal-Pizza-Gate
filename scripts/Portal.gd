extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var plrspawn = Vector2(100,80)

func _ready():
	connect('body_entered', self, '_on_body_enter')


func _on_body_enter(body):
	print("Collision")
	if true:#Status.Portals[0]:
		Status.Portals[0] = 0
		if (body.name == "PlayerOverworld"):
			Global.Player_Position = plrspawn
			Global.loading = 1
			get_tree().get_root().get_node("Control").newMap()
		