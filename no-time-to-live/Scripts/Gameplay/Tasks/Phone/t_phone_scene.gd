extends Node2D

var callType
var taskSelected : bool = false
var centerMouse := Vector2.ZERO

@onready var answerButton = $answerCallButton
@onready var denyButton = $denyCallButton
@onready var callerID = $CharacterBody2D/callerLabel

func _ready():
	SignalManager.connect("callPhoneTask", _start_call_task)
	
func _process(_delta):
	if $".".global_position.x < 0:
		$".".global_position = Vector2(1, $".".global_position.y)
	if $".".global_position.y < 0:
		$".".global_position = Vector2($".".global_position.x, 1)

	if $".".global_position.x > 1700:
		$".".global_position = Vector2(1700, $".".global_position.y)
	if $".".global_position.y > 685:
		$".".global_position = Vector2( $".".global_position.x, 685)

func _start_call_task():
	callType  =  randi_range(1, 4)
	match callType:
		1:
			callerID.text = "Mom"
		2: 
			if(SignalManager.jobPool):
				callerID.text = "Work Inc"
			else:
				callerID.text = "Mom"
				callType = 1
		3:
			callerID.text = "Luigi's Pizza"
		4:
			callerID.text = "Scam Call Likely"
	
	
	callerID.visible = true
	answerButton.visible = true
	denyButton.visible = true
	
	

func _answer_call():
	match callType:
		1:
			SignalManager.emit_signal("callFamily")
		2:
			SignalManager.emit_signal("callWork")
		3:
			SignalManager.emit_signal("callPizza")
		4:
			SignalManager.emit_signal("callScam")
	
	callerID.visible = false
	answerButton.visible = false
	denyButton.visible = false
	$".".queue_free()


func _deny_call():
	callerID.visible = false
	answerButton.visible = false
	denyButton.visible = false
	$".".queue_free()

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton && event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			var phonePos = Rect2($".".global_position, $CharacterBody2D/ColorRect.size)
			if phonePos.has_point(event.position):
				print("test")
				taskSelected = true
				centerMouse = position - event.position 
		else:
			taskSelected = false
	elif event is InputEventMouse and taskSelected:
		position = event.position + centerMouse
