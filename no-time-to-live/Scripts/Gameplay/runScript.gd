extends Node

signal gameStart
signal gameEnd

@onready var socialBar = $socialBar
@onready var satietyBar = $satietyBar
@onready var moneyBar = $moneyBar

var gameActiveBool = 0

func _ready():
	print("nodes ready")

func _process(_delta):
	# Starts the game 
	if (Input.is_action_just_pressed("SpacebarInput") && gameActiveBool == 0):
		gameActiveBool = 1
		gameStart.emit()
		print("Game Start")
		print(gameActiveBool) 
		$buttonSettings.queue_free()
		$buttonQuit.queue_free()
		$taskGenerator.spawn_task("normal", "t_phone", false, Vector2(0,0))
		SignalManager.emit_signal("callPhoneTask")
	# Ends the game (placeholder condition to test title)
	elif (socialBar.value <= 0 && gameActiveBool == 1 ):
		gameActiveBool = 0
		gameEnd.emit()
		print("Game End")
		print(gameActiveBool)
	
	
