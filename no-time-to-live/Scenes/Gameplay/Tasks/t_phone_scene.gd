extends Node2D

var callType = randi_range(1, 4)


func _ready():
	pass
	
func _process(_delta):
	pass



func _answer_call() -> void:
	match callType:
		1:
			SignalManager.emit_signal("callFamily")
