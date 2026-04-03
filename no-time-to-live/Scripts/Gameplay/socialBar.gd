extends ProgressBar

@onready var socialBar = $"."

var numIntervals = 1.0
var gameStarted = 0

func _game_start_getter():
	gameStarted = 1
	socialBar.visible = true

func _timer_interval() -> void:
	if(gameStarted == 1):
		socialBar.value -= pow(numIntervals, .3)/2
		numIntervals += 1
