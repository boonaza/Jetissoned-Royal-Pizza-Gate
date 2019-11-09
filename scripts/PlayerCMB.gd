extends "PlayerOverworld.gd"


var Def = PlayerVars.Defense
var THP = PlayerVars.Health

func damage(var DMG):
	THP -= DMG
	PlayerVars.Health = THP
	print("Health Remaining = ", THP)
	if (THP <= 0):
		PlayerVars.changeHP(1)

