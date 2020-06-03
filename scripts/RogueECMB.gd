extends KinematicBody2D

const XPval = 20
const GPval = 50
var team = 2
var Health = 15
var MoSp = Vector2(-120,-1)
var ATK = 45
var DEF = 2

func _ready():
	Global.Enemy_Count += 1

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
	Global.Enemy_Count -= 1
	PlayerVars.changeEXP(XPval)
	Global.Gold += GPval
	get_child(0).queue_free()
	get_child(1).queue_free()
