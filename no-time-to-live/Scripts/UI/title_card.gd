extends Sprite2D

var speed = 300
var acceleration = 10
var gameStartBool = false

func _ready() -> void:
	SignalManager.connect("gameEnd", _game_end_signal)

func _game_start_signal():
	speed = -300
	acceleration = 10
	gameStartBool = true
	
func _game_end_signal() -> void:
	print("Game end signal test title card")
	speed = 300
	acceleration = 10
	position = Vector2(958.0, -595.0)
	gameStartBool = false

func _process(delta):
	if(gameStartBool && position.y > -409):
		position.y -= (speed + acceleration) * delta
		acceleration += 10   
		
	if(!gameStartBool && position.y <= 409):
		position.y += (speed + acceleration) * delta
		acceleration += 10
