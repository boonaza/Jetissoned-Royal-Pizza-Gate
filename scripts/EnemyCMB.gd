extends KinematicBody2D

var XPval = 20
var GPval = 50
var team = 2
var Health = 15
var MoSp = Vector2(-120,-1)
var ATK = 45
var DEF = 0

func _physics_process(delta):
	var ColNfo = move_and_collide(MoSp * delta)
	if ColNfo:
		MoSp = MoSp.bounce(ColNfo.normal)
		if(ColNfo.collider.name == "PlayerCMB"):
			ColNfo.collider.damage(ATK - ColNfo.collider.Def)
			#get_tree().change_scene("res://Tilemapping.tscn")
			
func damage(var DMG):
	Health -= DMG
	print( Health)
	if (Health <= 0):
		kill()
	print("Hit ", name, " for ", PlayerVars.Attack, " damage!")
func kill():
	PlayerVars.changeEXP(XPval)
	Global.GP += GPval
	queue_free()
