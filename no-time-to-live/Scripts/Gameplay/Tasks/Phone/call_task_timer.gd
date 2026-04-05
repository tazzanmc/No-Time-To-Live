extends Timer


func _ready() -> void:
	SignalManager.connect("callPhoneTask", _start_call_timer)

func _process(_delta):
	pass

func _start_call_timer():
	start()
