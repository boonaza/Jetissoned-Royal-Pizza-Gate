extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var toggle_pause:bool = true
onready var encounterLayer = get_node("EncounterLayer")
onready var POWCam = find_node("POWCamera",true,false)
#onready var encounter = find_node("Encounter")
var encounterFile = preload("res://scenes/Encounter.tscn")
onready var main = get_node("Main")
#onready var CTRCam = get_node("ControlCamera")
onready var PlayerOW = find_node("PlayerOverworld",true,false)
var PlayerEnc
var PCMBCam
var encounterStage
var CurrentEnemy
var encounterT = Timer.new()
var canEncount = 1
var wrEnemy
# Called when the node enters the scene tree for the first time.

func _ready():
	pause_mode = Node.PAUSE_MODE_PROCESS

func _unhandled_input(event):
	
	if Input.is_action_pressed("DebugSpawn"):
		get_tree().paused = toggle_pause
		if(toggle_pause):
			find_node("pause_popup").show()
		else:
			find_node("pause_popup").hide()
		toggle_pause = !(toggle_pause)
		print("Pause Pressed")
	
	if Input.is_action_pressed("Debug_Encounter"):
		
		remove_child(main)
	
		add_child(encounterFile.instance())
		get_node("Encounter").init()
		PCMBCam = find_node("EncounterCamera",true,false)
		PlayerEnc = find_node("PlayerCMB",true,false)
		PCMBCam.make_current()
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func encounterEnemy(var EnemyID):
	if (canEncount == 1):
		CurrentEnemy = EnemyID
		wrEnemy = weakref(CurrentEnemy)
		remove_child(main)
		add_child(encounterFile.instance())
		get_node("Encounter").init(EnemyID)
		encounterStage = get_node("Encounter")
		PCMBCam = find_node("EncounterCamera",true,false)
		PlayerEnc = find_node("PlayerCMB",true,false)
		PCMBCam.make_current()
		

func newMap(var MapID = 0):
	var newmainfile = load("res://scenes/Main.tscn")
	var newmain = newmainfile.instance()
	call_deferred("remove_child",main)
	var oldmain = main
	main = newmain
	call_deferred("oldmain.queue_free")
	call_deferred("add_child",newmain)
	#call_deferred("remove_child",main)
	#call_deferred("main",.queue_free())
	#Global.loading = 0

func returnOverworld(var Victory):
	remove_child(encounterStage)
	encounterStage.queue_free()
	add_child(main)
	canEncount = 0
	var t = Timer.new()
	t.set_wait_time(0.5)
	t.set_one_shot(true)
	self.add_child(t)
	t.start()
	if (wrEnemy.get_ref()):
		
		if(Victory == 1):
			CurrentEnemy.queue_free()
		if (Victory == 2):
			CurrentEnemy.position += Vector2(20,0)
		if (Victory == 3):
			main.get_tree().reload_current_scene()
	yield(t, "timeout")
	t.queue_free()
	canEncount = 1