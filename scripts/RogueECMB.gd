extends KinematicBody2D

const XPval = 20
const GPval = 50
var Health = 15
var MoSp = Vector2(-120,-1)
var ATK = 45

func _physics_process(delta):
	var ColNfo = move_and_collide(MoSp * delta)
	if ColNfo:
		MoSp = MoSp.bounce(ColNfo.normal)
		if(ColNfo.collider.name == "PlayerCMB"):
			ColNfo.collider.damage(ATK - ColNfo.collider.Def)
			#get_tree().change_scene("res://Tilemapping.tscn")
			
func damage(var DMG):
	Health -= DMG