extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
const XPval = 20
const GPval = 50
var Health = 15
var MoSp = Vector2(-120,-1)
var ATK = 45
# Called when the node enters the scene tree for the first time.

func _physics_process(delta):
	var ColNfo = move_and_collide(MoSp * delta)
	if ColNfo:
		MoSp = MoSp.bounce(ColNfo.normal)
		if(ColNfo.collider.name == "PlayerCMB"):
			ColNfo.collider.damage(ATK - ColNfo.collider.Def)
			#get_tree().change_scene("res://Tilemapping.tscn")
			
func damage(var DMG):
	Health -= DMG
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass