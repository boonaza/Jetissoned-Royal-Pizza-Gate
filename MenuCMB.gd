extends "res://Node2D.gd"

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Flee_pressed():
	var EscOdds = randi() % 100 
	if (EscOdds >= Global.EscapeChance):
		get_tree().change_scene("res://Tilemapping.tscn")
	pass # Replace with function body.


func _on_Attack_pressed():
	get_node("../Map/EnemyCMB").damage(PlayerVars.Attack)
	print("Hit ", get_node("../Map/EnemyCMB").name, " for ", PlayerVars.Attack, " damage!")
	if(get_node("../Map/EnemyCMB").Health <= 0):
		PlayerVars.changeEXP(get_node("../Map/EnemyCMB").XPval)
		Global.Gold += get_node("../Map/EnemyCMB").GPval
		print("Experience: ", PlayerVars.Experience)
		print("Gold: ", Global.Gold)
		get_tree().change_scene("res://Encounter.tscn")
	pass # Replace with function body.


func _on_Defend_pressed():
	get_node("../Map/PlayerCMB").Def += PlayerVars.Defense * 2
	pass # Replace with function body.
