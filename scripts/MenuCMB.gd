extends Node2D

onready var Player = get_node("..").find_node("PlayerCMB",1)
onready var Enemy = get_node("..").find_node("EnemyCMB",1)
onready var PlayAnim = Player.find_node("AnimationPlayer")
var Ready:bool = 1

func _unhandled_input(event):
	if Input.is_action_pressed("Attack"):
		_on_Attack_pressed()
	if Input.is_action_pressed("Defend"):
		_on_Defend_pressed()
	if Input.is_action_pressed("Flee"):
		_on_Flee_pressed()


func _on_Flee_pressed():
	if (Global.Ready == 1):
		var EscOdds = randi() % 100 
		Global.daze(3)
		PlayAnim.play("FLEE")
		yield(PlayAnim,"animation_finished")
		if ((EscOdds >= Global.EscapeChance)):
			get_tree().get_root().get_node("Control").returnOverworld(2)



func _on_Attack_pressed():
	#Enemy.damage(PlayerVars.Attack)
	if (Ready):
		PlayAnim.play("ATK")
		Ready = 0
		var t = Timer.new()
		t.set_wait_time(0.5)
		t.set_one_shot(true)
		self.add_child(t)
		t.start()
		yield(t, "timeout")
		Ready = 1
		t.queue_free()
		#yield(PlayAnim,"animation_finished")
		Player.create_arrow()
	
	#if(Enemy.Health <= 0):
	#	PlayerVars.changeEXP(Enemy.XPval)
	#	Global.Gold += Enemy.GPval
	#	print("Experience: ", PlayerVars.Experience)
	#	print("Gold: ", Global.Gold)
	#	get_tree().change_scene("res://scenes/Encounter.tscn")


func _on_Defend_pressed():
	Player.Def += PlayerVars.Defense * 2
	PlayAnim.play("DEF")
	yield(PlayAnim,"animation_finished")


func _on_Reload_pressed():
	get_tree().change_scene("res://scenes/Encounter.tscn")
	pass # Replace with function body.
