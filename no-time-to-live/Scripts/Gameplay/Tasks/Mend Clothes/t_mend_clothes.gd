extends Node2D

signal mendTaskComplete
signal tailorTaskComplete
signal clothesTaskFail

var promptSelected : bool = false
var taskSelected : bool = false
var centerMouse := Vector2.ZERO
var taskCompleted : bool = false

func _ready():
	SignalManager.connect("gameEnd", _end_game_call)

func _end_game_call():
	$".".queue_free()

func _process(float) -> void:
	if (taskCompleted && $mendClothesTask/dragCollider/holePlaceholder.scale.x > 0):
		$mendClothesTask/dragCollider/holePlaceholder.scale.x -= .01
	if($mendClothesTask/dragCollider/holePlaceholder.scale.x < .01):
		$".".queue_free()

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
	SignalManager.tailorTaskComplete.emit()
	$".".queue_free() 


func _mend_button_pressed() -> void:
	$mendClothesTask.show()
	$taskPrompt.hide()


func _on_sew_1_pressed() -> void:
	$mendClothesTask/sew1.hide()


func _on_sew_2_pressed() -> void:
	if($mendClothesTask/sew1.visible == false):
		$mendClothesTask/sew2.hide()

func _on_sew_3_pressed() -> void:
	if($mendClothesTask/sew2.visible == false):
		$mendClothesTask/sew3.hide()


func _on_sew_4_pressed() -> void:
	if($mendClothesTask/sew3.visible == false):
		$mendClothesTask/sew4.hide()


func _on_sew_5_pressed() -> void:
	if($mendClothesTask/sew4.visible == false):
		$mendClothesTask/sew5.hide()


func _on_sew_6_pressed() -> void:
	if($mendClothesTask/sew5.visible == false):
		$mendClothesTask/sew6.hide()


func _on_sew_7_pressed() -> void:
	if($mendClothesTask/sew6.visible == false):
		$mendClothesTask/sew7.hide()


func _on_sew_8_pressed() -> void:
	if($mendClothesTask/sew7.visible == false):
		$mendClothesTask/sew8.hide()


func _on_sew_9_pressed() -> void:
	if($mendClothesTask/sew8.visible == false):
		taskCompleted = true
		SignalManager.mendTaskComplete.emit()
		$mendClothesTask/sew9.hide()
		


func _on_timer_timeout() -> void:
	SignalManager.clothesTaskFail.emit()
	$".".queue_free()
