extends Node2D

var taskSelected : bool = false
var centerMouse := Vector2.ZERO

func _start():
	$".".show()

func _on_timer_timeout() -> void:
	SignalManager.cashedCheck.emit()
	SignalManager._disable_job_pool()
	$".".queue_free()

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton && event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			var checkPos = Rect2($ColorRect.global_position, $ColorRect.size)
			if checkPos.has_point(event.position):
				print("test")
				taskSelected = true
				centerMouse = position - event.position 
		else:
			taskSelected = false
	elif event is InputEventMouse and taskSelected:
		position = event.position + centerMouse

func _process(_delta):
	if $".".global_position.x < 0:
		$".".global_position = Vector2(1, $".".global_position.y)
	if $".".global_position.y < 0:
		$".".global_position = Vector2($".".global_position.x, 1)

	if $".".global_position.x > 1250:
		$".".global_position = Vector2(1250, $".".global_position.y)
	if $".".global_position.y > 850:
		$".".global_position = Vector2( $".".global_position.x, 850)
