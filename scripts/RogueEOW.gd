extends KinematicBody2D

const XPval = 20
const GPval = 50
var MoSp = Vector2(20,20)


func _physics_process(delta):
	var ColNfo = move_and_collide(MoSp * delta)
	if ColNfo:
		MoSp = MoSp.bounce(ColNfo.normal)
		if(ColNfo.collider.name == "PlayerOverworld"):
			Encounter(ColNfo)

func Encounter(var CollInfo):
			print("Oh no!  You have been attacked by a Bandit!")
			Global.Store_Position(CollInfo.collider.get_position(),get_position())
			print(CollInfo.collider.get_position(), " ", get_position())
			get_tree().change_scene("res://scenes/Encounter.tscn")