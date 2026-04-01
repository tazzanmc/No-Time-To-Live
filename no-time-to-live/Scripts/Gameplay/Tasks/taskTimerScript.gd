extends Timer

signal callPhoneTask

@onready var taskTimer = $"."
var minWaitTime = 30.0
var maxWaitTime = 35.0
var taskRandomizer

func _on_timeout() -> void:
	taskTimer.wait_time = randf_range(minWaitTime, maxWaitTime)
	var ranTime = randfn(.15, .50)
	
	if(minWaitTime > 5):
		minWaitTime -= ranTime
	if(maxWaitTime > 10):
		maxWaitTime -= ranTime
	
	taskRandomizer = randi_range(1, 14)
	callPhoneTask.emit()
	
