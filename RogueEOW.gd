extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
const XPval = 20
const GPval = 50
var MoSp = Vector2(20,20)
# Called when the node enters the scene tree for the first time.

func _physics_process(delta):
	var ColNfo = move_and_collide(MoSp * delta)
	if ColNfo:
		MoSp = MoSp.bounce(ColNfo.normal)
		if(ColNfo.collider.name == "PlayerOverworld"):
			get_tree().change_scene("res://Encounter.tscn")
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
