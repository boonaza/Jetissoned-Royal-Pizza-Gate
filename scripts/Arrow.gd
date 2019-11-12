extends "res://scripts/Projectile.gd"

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
func _ready():
	new(1, Vector2(100,1), PlayerVars.Attack, 1, 1)
# Called when the node enters the scene tree for the first time.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
