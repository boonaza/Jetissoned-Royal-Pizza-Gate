extends KinematicBody2D


var MoSp = Vector2(Global.rng.randi_range(-5,5),Global.rng.randi_range(-5,5))
var itemname = "boots"
var itemid = 1
var available:bool = 1

func _physics_process(delta):
	var ColNfo = move_and_collide(MoSp * delta)
	if ColNfo:
		MoSp = MoSp.bounce(ColNfo.normal)
		if ((ColNfo.collider.name == "PlayerOverworld") && (available)):
			ColNfo.collider.claim_item(itemid,itemname)
			claim()
			
func claim():
	available = 0