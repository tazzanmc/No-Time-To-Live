extends Timer

signal randomizeTask

@onready var taskTimer = $"."
var minWaitTime = 5.0
var maxWaitTime = 10.0
var taskRandomizer

func _ready():
	pass

func _on_timeout() -> void:
	print("task timer timeout")
	taskTimer.wait_time = randf_range(minWaitTime, maxWaitTime)
	var ranTime = randfn(.15, .50)
	
	if(minWaitTime > 1):
		minWaitTime -= ranTime
	if(maxWaitTime > 2.5):
		maxWaitTime -= ranTime
	
	randomizeTask.emit()

func _randomize_task():
	taskRandomizer = randi_range(1, 14)
	SignalManager.emit_signal("callPhoneTask")
