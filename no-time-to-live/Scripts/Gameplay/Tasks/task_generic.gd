extends Node2D
class_name task_generic

var taskSelected : bool = false
var centerMouse := Vector2.ZERO
var active : bool = true

func _input(event: InputEvent) -> void:
	if active:
		if event is InputEventMouseButton && event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				var taskPos = Rect2($".".global_position, $ColorRect.size)
				if taskPos.has_point(event.position):
					taskSelected = true
					centerMouse = position - event.position 
			else:
				taskSelected = false
		elif taskSelected:
			position = position.lerp(event.position + centerMouse, get_process_delta_time() * 60)

func win() -> void:
	active = false
	self.queue_free()

func fail() -> void:
	active = false
	self.queue_free()
