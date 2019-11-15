extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
#var enemyT = preload("res://scenes/EnemyCMB.tscn")

#func _ready():
#	create_enemy()
# Called when the node enters the scene tree for the first time.
#func _unhandled_input(event):
#	if Input.is_action_pressed("DebugSpawn"):
#		create_enemy()
var EnemyType = "RogueECMB.tscn"
var child = preload("res://scenes/RogueECMB.tscn")


# Called when the node enters the scene tree for the first time.
#func _ready():
#	create_child()


func spawn():
	var new_child = child.instance()
	new_child.position = Global.Enemy_Position #+ Vector2(Global.rng.randi() % 10,Global.rng.randi() % 10)#position + Vector2(20,1)
	new_child.set_name("Enemy" + str(Global.rng.randf()))
	add_child(new_child)
#func create_enemy():
#	var new_enemy = enemyT.instance()
#	new_enemy.position = position + Vector2(1,1)
	#new_enemy.set_name("Enemy" + str(Global.rng.randf()))
	#get_parent().get_parent().add_child(new_enemy)  #call_deferred("add_child",new_enemy) 
#	get_parent().get_parent().add_child(new_enemy)
#	print("Child Spawned")
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
