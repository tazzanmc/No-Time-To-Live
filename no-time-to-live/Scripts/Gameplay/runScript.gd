extends Node

signal gameStart

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
		if $".".find_child("buttonSettings", false, true) != null && $".".find_child("buttonQuit", false, true) != null:
			$buttonSettings.queue_free()
			$buttonQuit.queue_free()
		$taskGenerator.spawn_task("normal", "t_phone", false, Vector2(0,0))
		SignalManager.emit_signal("callPhoneTask")
		SignalManager.gameEndBool = false
	# Ends the game (placeholder condition to test title)
	if (socialBar.value <= 0 && gameActiveBool == 1 || moneyBar.value <= 0 ||satietyBar.value <= 0):
		gameActiveBool = 0
		SignalManager.gameEnd.emit()
		SignalManager._game_end_bool()
	
	
