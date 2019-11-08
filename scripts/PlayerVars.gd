extends Node

var MaxHealth = 100
var Health = 100
var Experience = 0
var Level = 1
var Deaths = 0
var Attack = 10
var Defense = 2

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
	
func kill():
	print("Game Over")
	print(Deaths)
	return 1