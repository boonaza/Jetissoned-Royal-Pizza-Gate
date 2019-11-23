extends Node

var MaxHealth = 100
var Health = 100
var Experience = 0
var Level = 1
var Deaths = 0
var Attack = 10
var Defense = 2
var ismoving:int = 0 #[idle, north, south, west, east]
var Name = "Player1"
var Motion_Speed_OW = 50
var ArrowSpeed = 1.5
var ArrowCooldown = 0.5

func changeHP(var dmg):
	Health += dmg
	print(Health)
	if (Health <= 0):
		Deaths += kill()
	
func changeMaxHP(var growth):
	MaxHealth += growth
	
func changeEXP(var EXP):
	Experience += EXP
	while (Experience >= Level*100):
		Experience -= Level*100
		var level = LevelUp()
		print("Congratulations! You are now Level ", Level, ".")

func LevelUp():
	Level += 1
	MaxHealth += Level*10
	Health = MaxHealth
	Attack += Level*2
	Defense += Level
	ArrowSpeed += Level*0.01
	ArrowCooldown -= Level*0.01
	
func kill():
	print("Game Over")
	print(Deaths)
	return 1
	
func Restart():
	MaxHealth = 100
	Health = 100
	Experience = 0
	Level = 1
	Deaths = 0
	Attack = 10
	Defense = 2
	Name = "Player1"
	Motion_Speed_OW = 50