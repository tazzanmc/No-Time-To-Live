extends Node2D

signal cookTaskComplete

var startCooking = true
var cookPromptSelected : bool = false
var cookTaskSelected : bool = false
var centerCookMouse := Vector2.ZERO
var touchBottomPanCount = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	touchBottomPanCount = 0
	$fryingPanMinigame/Pan.hide()
	$fryingPanMinigame/GrilledCheese.hide()
	SignalManager.connect("gameEnd", _end_game_call)

func _end_game_call():
	$".".queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if(startCooking):
		if touchBottomPanCount > 10:
			SignalManager.cookTaskComplete.emit()
			$".".queue_free()



func _deny_button_pressed() -> void:
	$".".queue_free()


func _confirm_button_pressed() -> void:
	$AudioStreamPlayer2D.play()
	$cookingPrompt/ColorRect.hide()
	$cookingPrompt/MenuLabel.hide()
	$cookingPrompt/confirmButton.hide()
	$cookingPrompt/denyButton.hide()
	
	$fryingPanMinigame/Pan.show()
	$fryingPanMinigame/GrilledCheese.show()
	
	$fryingPanMinigame/Pan.position = Vector2(0, 0)
	$fryingPanMinigame/GrilledCheese.position = Vector2(0, -400)
	print(Vector2(get_viewport_rect().size / 2))
	
	startCooking = true

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton && event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			var cookPromptPos = Rect2($cookingPrompt/ColorRect.global_position, $cookingPrompt/ColorRect.size)
			var panPos = Rect2($fryingPanMinigame/Pan/ColorRect.global_position, $fryingPanMinigame/Pan/ColorRect.size)
			if cookPromptPos.has_point(abs(event.position)):
				cookPromptSelected = true
				centerCookMouse = $cookingPrompt.position - event.position 
			elif panPos.has_point(abs(event.position)):
				cookTaskSelected = true
				centerCookMouse = $fryingPanMinigame/Pan.position - event.position
		else:
			cookPromptSelected = false
			cookTaskSelected = false
	elif event is InputEventMouse and cookPromptSelected:
		$cookingPrompt.position = event.position + centerCookMouse
	elif event is InputEventMouse and cookTaskSelected:
		$fryingPanMinigame/Pan.position = event.position + centerCookMouse
		

func _sandwich_area_entered(area: Area2D) -> void:
	touchBottomPanCount += 1


func _on_timer_timeout() -> void:
	$".".queue_free()
