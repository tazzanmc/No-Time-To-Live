extends Node2D

var callType

@onready var answerButton = $answerCallButton
@onready var denyButton = $denyCallButton
@onready var callerID = $CharacterBody2D/callerLabel

func _ready():
	SignalManager.connect("callPhoneTask", _start_call_task)
	
func _process(_delta):
	pass

func _start_call_task():
	callType  =  randi_range(1, 4)
	match callType:
		1:
			callerID.text = "Mom"
		2: 
			callerID.text = "Work Inc"
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

func _deny_call():
	callerID.visible = false
	answerButton.visible = false
	denyButton.visible = false
