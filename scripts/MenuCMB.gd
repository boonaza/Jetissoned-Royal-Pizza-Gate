extends Node2D

onready var Player = find_node("../PlayerCMB")
onready var Enemy = find_node("../EnemyCMB")

func _on_Flee_pressed():
	if (Global.Ready == 1):
		var EscOdds = randi() % 100 
		Global.daze(3)
		get_node("../Map/PlayerCMB/AnimationPlayer").play("FLEE")
		yield(get_node("../Map/PlayerCMB/AnimationPlayer"),"animation_finished")
		if ((EscOdds >= Global.EscapeChance)):
			get_tree().change_scene("res://scenes/Main.tscn")


func _on_Attack_pressed():
	get_node("../Map/EnemyCMB").damage(PlayerVars.Attack)
	get_node("../Map/PlayerCMB/AnimationPlayer").play("ATK")
	yield(get_node("../Map/PlayerCMB/AnimationPlayer"),"animation_finished")
	print("Hit ", get_node("../Map/EnemyCMB").name, " for ", PlayerVars.Attack, " damage!")
	
	if(get_node("../Map/EnemyCMB").Health <= 0):
		PlayerVars.changeEXP(get_node("../Map/EnemyCMB").XPval)
		Global.Gold += get_node("../Map/EnemyCMB").GPval
		print("Experience: ", PlayerVars.Experience)
		print("Gold: ", Global.Gold)
		get_tree().change_scene("res://scenes/Encounter.tscn")


func _on_Defend_pressed():
	get_node("../Map/PlayerCMB").Def += PlayerVars.Defense * 2
	get_node("../Map/PlayerCMB/AnimationPlayer").play("DEF")
	yield(get_node("../Map/PlayerCMB/AnimationPlayer"),"animation_finished")