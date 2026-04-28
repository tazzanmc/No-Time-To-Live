extends Node2D

@onready var fuseBox = [false,false,false,false,false,false,true,true,true,true,true,true]
var count = 0
var taskSelected : bool = false
var centerMouse := Vector2.ZERO

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
	#SignalManager._power_out()
	#SignalManager.connect("gameEnd", _end_game_call)

func _end_game_call():
	$".".queue_free()

func _process(float) -> void:
	if !$CheckButton1.button_pressed:
		$breakerSwitch1.flip_h = true
	else:
		$breakerSwitch1.flip_h = false
	if !$CheckButton2.button_pressed:
		$breakerSwitch2.flip_h = true
	else:
		$breakerSwitch2.flip_h = false
	if !$CheckButton3.button_pressed:
		$breakerSwitch3.flip_h = true
	else:
		$breakerSwitch3.flip_h = false
	if !$CheckButton4.button_pressed:
		$breakerSwitch4.flip_h = true
	else:
		$breakerSwitch4.flip_h = false
	if !$CheckButton5.button_pressed:
		$breakerSwitch5.flip_h = true
	else:
		$breakerSwitch5.flip_h = false
	if !$CheckButton6.button_pressed:
		$breakerSwitch6.flip_h = true
	else:
		$breakerSwitch6.flip_h = false
	if !$CheckButton7.button_pressed:
		$breakerSwitch7.flip_h = true
	else:
		$breakerSwitch7.flip_h = false
	if !$CheckButton8.button_pressed:
		$breakerSwitch8.flip_h = true
	else:
		$breakerSwitch8.flip_h = false
	if !$CheckButton9.button_pressed:
		$breakerSwitch9.flip_h = true
	else:
		$breakerSwitch9.flip_h = false
	if !$CheckButton10.button_pressed:
		$breakerSwitch10.flip_h = true
	else:
		$breakerSwitch10.flip_h = false
	if !$CheckButton11.button_pressed:
		$breakerSwitch11.flip_h = true
	else:
		$breakerSwitch11.flip_h = false
	if !$CheckButton12.button_pressed:
		$breakerSwitch12.flip_h = true
	else:
		$breakerSwitch12.flip_h = false

func _on_check_button_1_pressed() -> void:
	flipSwitch($breakerSwitch1, fuseBox[0])
	$AudioStreamPlayer2D.pitch_scale = randf_range(.5, 1.5)
	$AudioStreamPlayer2D.play()
	if($CheckButton1.button_pressed):
		fuseBox[0] = true
	elif(!$CheckButton1.button_pressed):
		fuseBox[0]= false
	if(arrayCount()):
		SignalManager.emit_signal("breakerTaskComplete")
		SignalManager._power_restored()
		$".".queue_free()


func _on_check_button_2_pressed() -> void:
	flipSwitch($breakerSwitch2, fuseBox[1])
	$AudioStreamPlayer2D.pitch_scale = randf_range(.5, 1.5)
	$AudioStreamPlayer2D.play()
	if($CheckButton2.button_pressed):
		fuseBox[1] = true
	elif(!$CheckButton2.button_pressed):
		fuseBox[1]= false
	if(arrayCount()):
		SignalManager.emit_signal("breakerTaskComplete")
		SignalManager._power_restored()
		queue_free()


func _on_check_button_3_pressed() -> void:
	flipSwitch($breakerSwitch3, fuseBox[2])
	$AudioStreamPlayer2D.pitch_scale = randf_range(.5, 1.5)
	$AudioStreamPlayer2D.play()
	if($CheckButton3.button_pressed):
		fuseBox[2] = true
	elif(!$CheckButton3.button_pressed):
		fuseBox[2]= false
	if(arrayCount()):
		SignalManager.emit_signal("breakerTaskComplete")
		SignalManager._power_restored()
		queue_free()

func _on_check_button_4_pressed() -> void:
	flipSwitch($breakerSwitch4, fuseBox[3])
	$AudioStreamPlayer2D.pitch_scale = randf_range(.5, 1.5)
	$AudioStreamPlayer2D.play()
	if($CheckButton4.button_pressed):
		fuseBox[3] = true
	elif(!$CheckButton4.button_pressed):
		fuseBox[3]= false
	if(arrayCount()):
		SignalManager.emit_signal("breakerTaskComplete")
		SignalManager._power_restored()
		queue_free()


func _on_check_button_5_pressed() -> void:
	flipSwitch($breakerSwitch5, fuseBox[4])
	$AudioStreamPlayer2D.pitch_scale = randf_range(.5, 1.5)
	$AudioStreamPlayer2D.play()
	if($CheckButton5.button_pressed):
		fuseBox[4] = true
	elif(!$CheckButton5.button_pressed):
		fuseBox[4]= false
	if(arrayCount()):
		SignalManager.emit_signal("breakerTaskComplete")
		SignalManager._power_restored()
		queue_free()


func _on_check_button_6_pressed() -> void:
	flipSwitch($breakerSwitch6, fuseBox[5])
	$AudioStreamPlayer2D.pitch_scale = randf_range(.5, 1.5)
	$AudioStreamPlayer2D.play()
	if($CheckButton6.button_pressed):
		fuseBox[5] = true
	elif(!$CheckButton6.button_pressed):
		fuseBox[5]= false
	if(arrayCount()):
		SignalManager.emit_signal("breakerTaskComplete")
		SignalManager._power_restored()
		queue_free()


func _on_check_button_7_pressed() -> void:
	flipSwitch($breakerSwitch7, fuseBox[6])
	$AudioStreamPlayer2D.pitch_scale = randf_range(.5, 1.5)
	$AudioStreamPlayer2D.play()
	if($CheckButton7.button_pressed):
		fuseBox[6] = true
	elif(!$CheckButton7.button_pressed):
		fuseBox[6]= false
	if(arrayCount()):
		SignalManager.emit_signal("breakerTaskComplete")
		SignalManager._power_restored()
		queue_free()


func _on_check_button_8_pressed() -> void:
	flipSwitch($breakerSwitch8, fuseBox[7])
	$AudioStreamPlayer2D.pitch_scale = randf_range(.5, 1.5)
	$AudioStreamPlayer2D.play()
	if($CheckButton8.button_pressed):
		fuseBox[7] = true
	elif(!$CheckButton8.button_pressed):
		fuseBox[7]= false
	if(arrayCount()):
		SignalManager.emit_signal("breakerTaskComplete")
		SignalManager._power_restored()
		queue_free()


func _on_check_button_9_pressed() -> void:
	flipSwitch($breakerSwitch9, fuseBox[8])
	$AudioStreamPlayer2D.pitch_scale = randf_range(.5, 1.5)
	$AudioStreamPlayer2D.play()
	if($CheckButton9.button_pressed):
		fuseBox[8] = true
	elif(!$CheckButton9.button_pressed):
		fuseBox[8]= false
	if(arrayCount()):
		SignalManager.emit_signal("breakerTaskComplete")
		SignalManager._power_restored()
		queue_free()


func _on_check_button_10_pressed() -> void:
	flipSwitch($breakerSwitch10, fuseBox[9])
	$AudioStreamPlayer2D.pitch_scale = randf_range(.5, 1.5)
	$AudioStreamPlayer2D.play()
	if($CheckButton10.button_pressed):
		fuseBox[9] = true
	elif(!$CheckButton10.button_pressed):
		fuseBox[9]= false
	if(arrayCount()):
		SignalManager.emit_signal("breakerTaskComplete")
		SignalManager._power_restored()
		queue_free()


func _on_check_button_11_pressed() -> void:
	flipSwitch($breakerSwitch11, fuseBox[10])
	$AudioStreamPlayer2D.pitch_scale = randf_range(.5, 1.5)
	$AudioStreamPlayer2D.play()
	if($CheckButton11.button_pressed):
		fuseBox[10] = true
	elif(!$CheckButton11.button_pressed):
		fuseBox[10]= false
	if(arrayCount()):
		SignalManager.emit_signal("breakerTaskComplete")
		SignalManager._power_restored()
		queue_free()


func _on_check_button_12_pressed() -> void:
	flipSwitch($breakerSwitch12, fuseBox[11])
	$AudioStreamPlayer2D.pitch_scale = randf_range(.5, 1.5)
	$AudioStreamPlayer2D.play()
	if($CheckButton12.button_pressed):
		fuseBox[11] = true
	elif(!$CheckButton12.button_pressed):
		fuseBox[11]= false
	if(arrayCount()):
		SignalManager._power_restored()
		SignalManager.emit_signal("breakerTaskComplete")

func arrayCount() -> bool:
	var fullTrue = true
	for x in 12:
		if(!fuseBox[x]):
			fullTrue = false
			return fullTrue
	return fullTrue

func flipSwitch(switchSprite, stateBool):
	if(stateBool):
		switchSprite.flip_h = true
	else:
		switchSprite.flip_h = false

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton && event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			var breakerPos = Rect2($ColorRect.global_position, $ColorRect.size)
			if breakerPos.has_point(event.position):
				taskSelected = true
				centerMouse = position - event.position 
		else:
			taskSelected = false
	elif event is InputEventMouse and taskSelected:
		position = event.position + centerMouse
