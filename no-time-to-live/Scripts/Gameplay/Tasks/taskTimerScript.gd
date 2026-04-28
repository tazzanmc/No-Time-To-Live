extends Timer

signal randomizeTask

@onready var taskTimer = $"."
@onready var taskGen := $"../taskGenerator"
@export var minWaitTime: float = 5.0
@export var maxWaitTime: float = 10.0
var taskRandomizer: int


func _ready():
	taskTimer.wait_time = randf_range(minWaitTime, maxWaitTime)
	SignalManager.connect("failedAccounting", _failed_accounting)

func _on_timeout() -> void:
	print("task timer timeout")
	taskTimer.wait_time = randf_range(minWaitTime, maxWaitTime)
	var ranTime = randfn(.15, .50)
	
	if(minWaitTime > 1):
		minWaitTime -= ranTime
	if(maxWaitTime > 2.5):
		maxWaitTime -= ranTime
	if !SignalManager.gameEndBool:
		randomizeTask.emit()

func _failed_accounting():
	taskGen.spawn_task("auto", "t_pinkSlip", false, Vector2(randi_range(0, 640), randi_range(0, 360)))

func _randomize_task():
	#taskRandomizer = 4
	taskRandomizer = randi_range(1, 10)

	# Spawns in one of the random tasks for the player
	if taskRandomizer == 1:
		taskGen.spawn_task("normal", "t_makeFood", false, Vector2(randi_range(0, 640), randi_range(0, 360)))
	elif taskRandomizer == 2:
		taskGen.spawn_task("normal", "t_groceryList", false, Vector2(randi_range(0, 640), randi_range(0, 360)))		
	elif taskRandomizer == 3:
		taskGen.spawn_task("linked", "t_mendClothes", false, Vector2(randi_range(0, 640), randi_range(0, 360)))
	elif taskRandomizer == 4:
		if 	!SignalManager.friendsActivated:
			taskGen.spawn_task("auto", "t_friendsArrive", false, Vector2(0,0))
	elif taskRandomizer == 5:
		taskGen.spawn_task("vital", "t_rentDue", false, Vector2(randi_range(0, 640), randi_range(0, 360)))
	elif taskRandomizer == 6:
		taskGen.spawn_task("vital", "t_electricalOutage", false, Vector2(randi_range(0, 640), randi_range(0, 360)))
	elif taskRandomizer == 7 && SignalManager.powerOut:
		SignalManager.callPhoneTask.emit()
	elif taskRandomizer == 8:
		if(!SignalManager.jobPool):
			taskGen.spawn_task("normal", "t_jobApp", false, Vector2(randi_range(0, 640), randi_range(0, 360)))
		else:
			taskGen.spawn_task("auto", "t_payCheque", false, Vector2(randi_range(0, 640), randi_range(0, 360)))
	elif taskRandomizer == 9:
		if(!SignalManager.jobPool):
			taskGen.spawn_task("normal", "t_jobApp", false, Vector2(randi_range(0, 640), randi_range(0, 360)))
		else:
			taskGen.spawn_task("normal", "t_accounting", false, Vector2(randi_range(0, 640), randi_range(0, 360)))
	elif taskRandomizer == 10:
		if(SignalManager.jobPool):
			taskGen.spawn_task("normal", "t_jobApp", false, Vector2(randi_range(0, 640), randi_range(0, 360)))
		else:
			taskGen.spawn_task("auto", "t_payCheque", false, Vector2(randi_range(0, 640), randi_range(0, 360)))
