extends Node

var IDLE:String
var NORTH:String
var SOUTH:String
var WEST:String
var EAST:String

#Picks an animation specified by child and current direction
func setAnimation(aniCode, player):
	match aniCode:
		0: #Idle
			player.play(IDLE)	
		1: #North
			player.play(NORTH)
		2: #South
			player.play(SOUTH)
		3: #East
			player.play(EAST)	
		4: #West
			player.play(WEST)	