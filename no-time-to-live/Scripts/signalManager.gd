extends Node

# Phone task signals
signal callPhoneTask()
signal callFamily()
signal callWork()
signal callPizza()
signal callScam()

var jobPool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalManager.connect("callScam", _on_call_scam)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _on_call_scam():
	jobPool = true
