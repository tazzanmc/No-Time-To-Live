extends ProgressBar

@onready var moneyBar = $"."

var numIntervals = 1.0
var gameStarted = 0

func _game_start_getter():
	moneyBar.visible = true
	gameStarted = 1

func _timer_interval() -> void:
	if(gameStarted == 1):
		moneyBar.value -= pow(numIntervals, .3)/2
		numIntervals += 1
