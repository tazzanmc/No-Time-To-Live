extends Sprite2D

var speed = 300
var acceleration = 10
var gameStartBool = false

func _game_start_signal():
	speed = -300
	acceleration = 10
	gameStartBool = true
	
func _game_end_signal() -> void:
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
