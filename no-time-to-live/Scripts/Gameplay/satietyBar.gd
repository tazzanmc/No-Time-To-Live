extends ProgressBar

@onready var satietyBar = $"."

var numIntervals = 1.0
var gameStarted = 0

func _ready():
	SignalManager.connect("callPizza", _on_call_pizza)
	SignalManager.connect("completedGroceryTask", _on_complete_grocery)
	SignalManager.connect("cookTaskComplete", _on_complete_cook)

func _game_start_getter():
	gameStarted = 1
	satietyBar.visible = true

func _timer_interval() -> void:
	if(gameStarted == 1):
		satietyBar.value -= pow(numIntervals, .3)/2
		numIntervals += 1

func _on_call_pizza():
	satietyBar.value += 10

func _on_complete_grocery():
	satietyBar.value += 20
	print("succes2")

func _on_complete_cook():
	satietyBar.value += 15
