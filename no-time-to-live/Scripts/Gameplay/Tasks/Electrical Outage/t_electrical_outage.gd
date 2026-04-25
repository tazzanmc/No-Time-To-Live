extends Node2D

@onready var fuseBox = [false,false,false,false,false,false,true,true,true,true,true,true]
var count = 0

signal breakerTaskComplete

func _ready():
	fuseBox.shuffle()
	$CheckButton1.button_pressed = fuseBox[0]
	$CheckButton2.button_pressed = fuseBox[1]
	$CheckButton3.button_pressed = fuseBox[2]
	$CheckButton4.button_pressed = fuseBox[3]
	$CheckButton5.button_pressed = fuseBox[4]
	$CheckButton6.button_pressed = fuseBox[5]
	$CheckButton7.button_pressed = fuseBox[6]
	$CheckButton8.button_pressed = fuseBox[7]
	$CheckButton9.button_pressed = fuseBox[8]
	$CheckButton10.button_pressed = fuseBox[9]
	$CheckButton11.button_pressed = fuseBox[10]
	$CheckButton12.button_pressed = fuseBox[11]
	



func _on_check_button_1_pressed() -> void:
	if($CheckButton1.button_pressed):
		fuseBox[0] = true
	elif(!$CheckButton1.button_pressed):
		fuseBox[0]= false
	if(arrayCount()):
		SignalManager.emit_signal("breakerTaskComplete")
		queue_free()


func _on_check_button_2_pressed() -> void:
	if($CheckButton2.button_pressed):
		fuseBox[1] = true
	elif(!$CheckButton2.button_pressed):
		fuseBox[1]= false
	if(arrayCount()):
		SignalManager.emit_signal("breakerTaskComplete")
		queue_free()


func _on_check_button_3_pressed() -> void:
	if($CheckButton3.button_pressed):
		fuseBox[2] = true
	elif(!$CheckButton3.button_pressed):
		fuseBox[2]= false
	if(arrayCount()):
		SignalManager.emit_signal("breakerTaskComplete")
		queue_free()

func _on_check_button_4_pressed() -> void:
	if($CheckButton4.button_pressed):
		fuseBox[3] = true
	elif(!$CheckButton4.button_pressed):
		fuseBox[3]= false
	if(arrayCount()):
		SignalManager.emit_signal("breakerTaskComplete")
		queue_free()


func _on_check_button_5_pressed() -> void:
	if($CheckButton5.button_pressed):
		fuseBox[4] = true
	elif(!$CheckButton5.button_pressed):
		fuseBox[4]= false
	if(arrayCount()):
		SignalManager.emit_signal("breakerTaskComplete")
		queue_free()


func _on_check_button_6_pressed() -> void:
	if($CheckButton6.button_pressed):
		fuseBox[5] = true
	elif(!$CheckButton6.button_pressed):
		fuseBox[5]= false
	if(arrayCount()):
		SignalManager.emit_signal("breakerTaskComplete")
		queue_free()


func _on_check_button_7_pressed() -> void:
	if($CheckButton7.button_pressed):
		fuseBox[6] = true
	elif(!$CheckButton7.button_pressed):
		fuseBox[6]= false
	if(arrayCount()):
		SignalManager.emit_signal("breakerTaskComplete")
		queue_free()


func _on_check_button_8_pressed() -> void:
	if($CheckButton8.button_pressed):
		fuseBox[7] = true
	elif(!$CheckButton8.button_pressed):
		fuseBox[7]= false
	if(arrayCount()):
		SignalManager.emit_signal("breakerTaskComplete")
		queue_free()


func _on_check_button_9_pressed() -> void:
	if($CheckButton9.button_pressed):
		fuseBox[8] = true
	elif(!$CheckButton9.button_pressed):
		fuseBox[8]= false
	if(arrayCount()):
		SignalManager.emit_signal("breakerTaskComplete")
		queue_free()


func _on_check_button_10_pressed() -> void:
	if($CheckButton10.button_pressed):
		fuseBox[9] = true
	elif(!$CheckButton10.button_pressed):
		fuseBox[9]= false
	if(arrayCount()):
		SignalManager.emit_signal("breakerTaskComplete")
		queue_free()


func _on_check_button_11_pressed() -> void:
	if($CheckButton11.button_pressed):
		fuseBox[10] = true
	elif(!$CheckButton11.button_pressed):
		fuseBox[10]= false
	if(arrayCount()):
		SignalManager.emit_signal("breakerTaskComplete")
		queue_free()


func _on_check_button_12_pressed() -> void:
	if($CheckButton12.button_pressed):
		fuseBox[11] = true
	elif(!$CheckButton12.button_pressed):
		fuseBox[11]= false
	if(arrayCount()):
		SignalManager.emit_signal("breakerTaskComplete")
		queue_free()

func arrayCount() -> bool:
	var fullTrue = true
	for x in 12:
		if(!fuseBox[x]):
			fullTrue = false
			return fullTrue
	return fullTrue
