
extends KinematicBody2D

const XPval = 200
const GPval = 500
var team = 2
var Health = 150
var MoSp = 3
var ATK = 45
var DEF = 20
var playerfound:bool = false
var playerC


func _ready():
	Global.Enemy_Count += 1
	

func _physics_process(delta):
	if !playerfound:
		playerC = get_tree().get_root().find_node("PlayerCMB",1,0)
	if(playerC):
		var PlayerAngle = (playerC.global_position - global_position).normalized()
		var ColNfo = move_and_collide(PlayerAngle * delta * MoSp)
		if ColNfo:
			move_and_collide(ColNfo.normal)
			if(ColNfo.collider.name == "PlayerCMB"):
				ColNfo.collider.damage(ATK - ColNfo.collider.Def)
			#get_tree().change_scene("res://Tilemapping.tscn")
			
func damage(var DMG):
	Health -= DMG
	print( Health)
	MoSp = MoSp * 1.5
	DEF -= 5
	if (Health <= 0):
		kill()
	print("Hit ", name, " for ", PlayerVars.Attack, " damage!")
		
func kill():
	Global.Enemy_Count -= 1
	PlayerVars.changeEXP(XPval)
	Global.Gold += GPval
	get_child(0).queue_free()
	get_child(1).queue_free()