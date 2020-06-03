extends KinematicBody2D

const XPval = 20
const GPval = 50
var team = 2
var MoSp = Vector2(20,20)

func _physics_process(delta):
	var ColNfo = move_and_collide(MoSp * delta)
	if ColNfo:
		MoSp = MoSp.bounce(ColNfo.normal)
		if(ColNfo.collider.name == "PlayerOverworld"):
			get_tree().change_scene("res://scenes/Encounter.tscn")
