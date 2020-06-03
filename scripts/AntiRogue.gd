extends KinematicBody2D

const XPval = 20
const GPval = 50
var team = 2
var MoSp = Vector2(30,30)
var ID = 2
const TrueID = 2
var playerfound:bool = false
var playerC
var daze = 0


func _physics_process(delta):
	#if !playerfound:
	#	playerC = get_tree().get_root().find_node("PlayerCMB",1,0)
	#if playerfound:
	var PlayerAngle = (Global.Player_Position - global_position).normalized()
	var ColNfo = move_and_collide(PlayerAngle * delta * 30)
	if ColNfo:
		#MoSp = MoSp.bounce((ColNfo.normal - 0.5*PlayerAngle).normalized())
		if(ColNfo.collider.name == "PlayerOverworld"):
			if !(PlayerVars.safe):
				Encounter(ColNfo)

func set_ID(var id):
	ID = id

func Encounter(var CollInfo):
			print("!tidnaB a yb dekcatta neeb evah uoY  !on hO")
			Global.Store_Position(CollInfo.collider.get_position(),get_position())
			print(CollInfo.collider.get_position(), " ", get_position())
			Global.Current_Enemy = ID
			get_tree().get_root().get_node("Control").encounterEnemy(self)