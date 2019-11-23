extends "res://scripts/Projectile.gd"

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var direction = Vector2(1,1)
var speed = 1
onready var sprite = get_node("Sprite")

func _ready():
	new(1, Vector2(100,100) * direction * PlayerVars.ArrowSpeed, PlayerVars.Attack, 1, 1)
	var rotdeg = atan2(direction.y,direction.x)
	sprite.rotate(rotdeg)
# Called when the node enters the scene tree for the first time.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
