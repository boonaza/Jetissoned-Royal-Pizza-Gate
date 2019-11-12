extends Node2D

onready var Player = get_node("..").find_node("PlayerCMB",1)
onready var Enemy = get_node("..").find_node("EnemyCMB",1)
onready var PlayAnim = Player.find_node("AnimationPlayer")

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
			get_tree().change_scene("res://scenes/Main.tscn")



func _on_Attack_pressed():
	Enemy.damage(PlayerVars.Attack)
	PlayAnim.play("ATK")
	yield(PlayAnim,"animation_finished")
	print("Hit ", Enemy.name, " for ", PlayerVars.Attack, " damage!")
	
	if(Enemy.Health <= 0):
		PlayerVars.changeEXP(Enemy.XPval)
		Global.Gold += Enemy.GPval
		print("Experience: ", PlayerVars.Experience)
		print("Gold: ", Global.Gold)
		get_tree().change_scene("res://scenes/Encounter.tscn")


func _on_Defend_pressed():
	Player.Def += PlayerVars.Defense * 2
	PlayAnim.play("DEF")
	yield(PlayAnim,"animation_finished")
