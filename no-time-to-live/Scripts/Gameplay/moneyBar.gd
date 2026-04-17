extends ProgressBar

@onready var moneyBar = $"."

var numIntervals = 1.0
var gameStarted = 0

func _ready():
	SignalManager.connect("callPizza", _on_call_pizza)
	SignalManager.connect("callWork", _on_call_work)
	SignalManager.connect("callScam", _on_call_scam)
	SignalManager.connect("completedGroceryTask", _on_complete_grocery)

func _game_start_getter():
	moneyBar.visible = true
	gameStarted = 1

func _timer_interval() -> void:
	if(gameStarted == 1):
		moneyBar.value -= pow(numIntervals, .3)/2
		numIntervals += 1

func _on_call_pizza():
	moneyBar.value -= 5

func _on_call_work():
	moneyBar.value += 15

func _on_call_scam():
	moneyBar.value -=20

func _on_complete_grocery():
	moneyBar.value -= 10
	print("succes")
