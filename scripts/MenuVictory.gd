extends Node2D

#var Main = preload("res://scenes/Main.tscn")
var Defeated = Global.Current_Enemy

func _unhandled_input(event):
	if Input.is_action_pressed("ui_accept"):
		_on_Return_pressed()

func _on_Return_pressed():
	Status.kill(Defeated)
	get_parent().returnOW()
