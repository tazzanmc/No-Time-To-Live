extends Node2D

var promptSelected : bool = false
var taskSelected : bool = false
var centerMouse := Vector2.ZERO

func _ready():
	pass



func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton && event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			# Finds where each object is
			var clothesPromptPos = Rect2($taskPrompt/promptPlaceholder.global_position, $taskPrompt/promptPlaceholder.size)
			var clothesTaskPos = Rect2($mendClothesTask/dragCollider/clothesPlaceholder.global_position, $mendClothesTask/dragCollider/clothesPlaceholder.size)
			if clothesPromptPos.has_point(event.position):
				promptSelected = true
				centerMouse = $taskPrompt.position - event.position
			elif clothesTaskPos.has_point(abs(event.position)):
				taskSelected = true
				centerMouse = $mendClothesTask.position - event.position
		else:
			taskSelected = false
			promptSelected = false
	elif event is InputEventMouse and taskSelected:
		$mendClothesTask.position = event.position + centerMouse
	elif event is InputEventMouse and promptSelected:
		$taskPrompt.position = event.position + centerMouse



func _tailor_button_pressed() -> void:
	$mendClothesTask.show()
	$taskPrompt.hide()


func _mend_button_pressed() -> void:
	# emit.mendTaskComplete
	$".".queue_free()

func _on_sew_area_1_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	print("test area")
	if(event is InputEventMouseButton && event.button_index == MOUSE_BUTTON_LEFT):
		pass
