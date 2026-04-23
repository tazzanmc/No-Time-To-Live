extends Node2D

var startCooking = true
var cookPromptSelected : bool = false
var cookTaskSelected : bool = false
var centerCookMouse := Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	print(get_viewport_rect())
	#$fryingPanMinigame/Pan.hide()
	#$fryingPanMinigame/GrilledCheese.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if(startCooking):
		pass



func _deny_button_pressed() -> void:
	$".".queue_free()


func _confirm_button_pressed() -> void:
	$cookingPrompt/ColorRect.hide()
	$cookingPrompt/Label.hide()
	$cookingPrompt/confirmButton.hide()
	$cookingPrompt/denyButton.hide()
	
	$fryingPanMinigame/Pan.show()
	$fryingPanMinigame/GrilledCheese.show()
	
	$fryingPanMinigame/Pan.position = Vector2(0, 0)
	$fryingPanMinigame/GrilledCheese.position = Vector2(0, -200)
	print(Vector2(get_viewport_rect().size / 2))
	
	startCooking = true

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton && event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			var cookPromptPos = Rect2($cookingPrompt/ColorRect.global_position, $cookingPrompt/ColorRect.size)
			var panPos = Rect2($fryingPanMinigame/Pan/ColorRect.global_position, $fryingPanMinigame/Pan/ColorRect.size)
			print(event.position)
			print(panPos)
			print(panPos.has_point(abs(event.position)))
			if cookPromptPos.has_point(abs(event.position)):
				cookPromptSelected = true
				centerCookMouse = $cookingPrompt.position - event.position 
			elif panPos.has_point(abs(event.position)):
				cookTaskSelected = true
				centerCookMouse = $fryingPanMinigame/Pan.position - event.position
				print("handle touched")
		else:
			cookPromptSelected = false
			cookTaskSelected = false
	elif event is InputEventMouse and cookPromptSelected:
		$cookingPrompt.position = event.position + centerCookMouse
	elif event is InputEventMouse and cookTaskSelected:
		$fryingPanMinigame/Pan.position = event.position + centerCookMouse

func _sandwich_area_entered(area: Area2D) -> void:
	print("Flipped sandwich")
