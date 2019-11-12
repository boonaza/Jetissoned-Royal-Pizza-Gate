extends KinematicBody2D

var Health = 15
var MoSp = Vector2(-120,-1)
var ATK = 45
var PEN = 1
var team = 1

func new(var hp, var ms, var at, var pn,var tm):
	Health = hp
	MoSp = ms
	ATK = at
	PEN = pn
	team = tm

func _physics_process(delta):
	var ColNfo = move_and_collide(MoSp * delta)
	if ColNfo:
		MoSp = MoSp.bounce(ColNfo.normal)
		if (ColNfo):
			PEN -= 1
			if(ColNfo.collider.has_method("damage")):
				if (ColNfo.collider.team != team):
					ColNfo.collider.damage(ATK - ColNfo.collider.DEF)
			if (PEN <= 0):
				queue_free()
			#get_tree().change_scene("res://Tilemapping.tscn")
			
func damage(var DMG):
	Health -= DMG