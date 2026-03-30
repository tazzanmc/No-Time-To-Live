extends Node

signal gameStart
signal gameEnd

var gameActiveBool = 0

func _process(delta):
	# Starts the game 
	if (Input.is_action_just_pressed("SpacebarInput") && gameActiveBool == 0):
		gameActiveBool = 1
		gameStart.emit()
		print("Game Start")
		print(gameActiveBool) 
	# Ends the game (placeholder condition to test title)
	elif (Input.is_action_just_pressed("SpacebarInput") && gameActiveBool == 1 ):
		gameActiveBool = 0
		gameEnd.emit()
		print("Game End")
		print(gameActiveBool)
