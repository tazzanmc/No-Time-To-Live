extends ProgressBar

@onready var satietyBar = $"."

var numIntervals = 1.0
var gameStarted = 0

func _game_start_getter():
	gameStarted = 1
	satietyBar.visible = true

func _timer_interval() -> void:
	if(gameStarted == 1):
		satietyBar.value -= pow(numIntervals, .3)/2
		numIntervals += 1
