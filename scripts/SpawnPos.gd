extends CollisionShape2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
var enemyT = preload("res://scenes/EnemyCMB.tscn")

#func _ready():
#	create_enemy()
# Called when the node enters the scene tree for the first time.
#func _unhandled_input(event):
#	if Input.is_action_pressed("DebugSpawn"):
#		create_enemy()

func create_enemy():
	var new_enemy = enemyT.instance()
	new_enemy.position = get_parent().position + Vector2(1,1)
	#new_enemy.set_name("Enemy" + str(Global.rng.randf()))
	#get_parent().get_parent().add_child(new_enemy)  #call_deferred("add_child",new_enemy) 
	add_child(new_enemy)
	print("Child Spawned")
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
