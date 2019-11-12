extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _unhandled_input(event):
	if Input.is_action_pressed("ui_accept"):
		_on_Retry_pressed()
	if Input.is_action_pressed("Flee"):
		_on_Quit_pressed()

func _on_Retry_pressed():
	PlayerVars.Restart()
	Global.Restart()
	get_tree().change_scene("res://scenes/Main.tscn")


func _on_Quit_pressed():
	get_tree().quit()
