extends ProgressBar

@onready var socialBar = $"."

var numIntervals = 1.0
var gameStarted = 0
var pausedBar = false

func _ready():
	SignalManager.connect("callFamily", _on_call_family)
	SignalManager.connect("mendTaskComplete", _on_mend_complete)
	SignalManager.connect("tailorTaskComplete", _on_tailor_complete)
	SignalManager.connect("pauseSocialBarSignal", _pause_social_bar)
	SignalManager.connect("unpauseSocialBarSignal", _unpause_social_bar)
	SignalManager.connect("clothesTaskFail", _clothes_task_fail)

func _game_start_getter():
	gameStarted = 1
	socialBar.visible = true

func _timer_interval() -> void:
	if(gameStarted == 1 && !pausedBar):
		socialBar.value -= pow(numIntervals, .3)/2
		numIntervals += 1

func _on_call_family():
	socialBar.value += 10

func _on_mend_complete():
	socialBar.value += 10

func _on_tailor_complete():
	socialBar.value += 10

func _pause_social_bar():
	print("Paused bar")
	pausedBar = true

func _unpause_social_bar():
	print("unPaused bar")
	pausedBar = false

func _clothes_task_fail():
	socialBar.value -= 20
