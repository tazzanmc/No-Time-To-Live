extends ProgressBar

@onready var socialBar = $"."

var numIntervals = 1.0
var gameStarted = 0

func _ready():
	SignalManager.connect("callFamily", _on_call_family)

func _game_start_getter():
	gameStarted = 1
	socialBar.visible = true

func _timer_interval() -> void:
	if(gameStarted == 1):
		socialBar.value -= pow(numIntervals, .3)/2
		numIntervals += 1

func _on_call_family():
	socialBar.value += 10
