extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var Main = preload("res://scenes/Main.tscn")
var Defeated = Global.Current_Enemy
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _unhandled_input(event):
	if Input.is_action_pressed("ui_accept"):
		_on_Return_pressed()

#Calls the command from encounter to return to the Overworld
func _on_Return_pressed():
	Status.kill(Defeated)
	get_parent().returnOW()
	

