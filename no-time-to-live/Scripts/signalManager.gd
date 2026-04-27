extends Node

# Phone task signals
signal callPhoneTask()
signal callFamily()
signal callWork()
signal callPizza()
signal callScam()

# Job Application signals
signal correctJobInfoSubmission()

# Grocery List signals
signal completedGroceryTask()
signal failedGrocery()

# Grilled cheese signals
signal cookTaskComplete()

# Mend clothes signals
signal mendTaskComplete()
signal tailorTaskComplete()
signal clothesTaskFail()

# Signing bills signals
signal billTaskComplete()
signal billTaskFailed()

# Friends arrive signals
signal pauseSocialBarSignal()
signal unpauseSocialBarSignal()

# Accounting signals
signal completedAccounting()
signal failedAccounting()

# Cashed cheque signal
signal cashedCheck()

# Pink slip signal
signal playerFired()

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

func _disable_job_pool():
	jobPool = false
	print("job pool disabled")
