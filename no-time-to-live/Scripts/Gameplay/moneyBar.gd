extends ProgressBar

@onready var moneyBar = $"."

var numIntervals = 1.0
var gameStarted = 0

func _ready():
	SignalManager.connect("callPizza", _on_call_pizza)
	SignalManager.connect("callWork", _on_call_work)
	SignalManager.connect("callScam", _on_call_scam)
	SignalManager.connect("completedGroceryTask", _on_complete_grocery)
	SignalManager.connect("mendTaskComplete", _on_mend_complete)
	SignalManager.connect("tailorTaskComplete", _on_tailor_complete)
	SignalManager.connect("billTaskComplete", _on_bill_complete)
	SignalManager.connect("billTaskFailed", _on_bill_failed)


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

func _on_mend_complete():
	moneyBar.value += 10

func _on_tailor_complete():
	moneyBar.value -= 10

func _on_bill_complete():
	moneyBar.value -= 20

func _on_bill_failed():
	moneyBar.value -=40
