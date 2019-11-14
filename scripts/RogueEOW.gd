extends KinematicBody2D

const XPval = 20
const GPval = 50
var team = 2
var MoSp = Vector2(20,20)
var ID = 0


func _physics_process(delta):
	var ColNfo = move_and_collide(MoSp * delta)
	var PlayerAngle = (Global.Player_Position - position).normalized()
	if ColNfo:
		MoSp = MoSp.bounce((ColNfo.normal - 0.5*PlayerAngle).normalized())
		if(ColNfo.collider.name == "PlayerOverworld"):
			Encounter(ColNfo)

func set_ID(var id):
	ID = id

func Encounter(var CollInfo):
			print("Oh no!  You have been attacked by a Bandit!")
			Global.Store_Position(CollInfo.collider.get_position(),get_position())
			print(CollInfo.collider.get_position(), " ", get_position())
			Global.Current_Enemy = ID
			get_tree().change_scene("res://scenes/Encounter.tscn")