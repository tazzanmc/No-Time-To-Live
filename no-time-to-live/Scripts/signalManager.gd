extends Node

# Phone task signals
signal callPhoneTask()
signal callFamily()
signal callWork()
signal callPizza()
signal callScam()
signal correctJobInfoSubmission()

var jobPool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalManager.correctJobInfoSubmission.connect(_enable_job_pool)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _enable_job_pool():
	jobPool = true
	print("job pool enabled")
