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
	get_tree().change_scene("res://scenes/Tilemapping.tscn")
	pass # Replace with function body.


func _on_Attack_pressed():
	get_tree().change_scene("res://scenes/Encounter.tscn")
	pass # Replace with function body.
