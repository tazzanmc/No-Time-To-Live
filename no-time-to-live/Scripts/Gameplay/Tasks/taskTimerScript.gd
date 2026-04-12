extends Timer

signal randomizeTask

@onready var taskTimer = $"."
@onready var taskGen := $"../taskGenerator"
@export var minWaitTime: float = 5.0
@export var maxWaitTime: float = 10.0
var taskRandomizer: int 


func _ready():
	taskTimer.wait_time = randf_range(minWaitTime, maxWaitTime)

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
	if taskRandomizer <= 7:
		SignalManager.emit_signal("callPhoneTask")
	else:
		taskGen.spawn_task("normal", "t_jobApp", false, Vector2(randi_range(0, 640), randi_range(0, 360)))
