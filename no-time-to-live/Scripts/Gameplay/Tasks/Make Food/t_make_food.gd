extends Node2D

var startCooking = false
var taskSelected : bool = false
var centerMouse := Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if(startCooking):
		pass



func _deny_button_pressed() -> void:
	$".".queue_free()


func _confirm_button_pressed() -> void:
	$ColorRect.hide()
	$Label.hide()
	$confirmButton.hide()
	$denyButton.hide()
	startCooking = true
	
func _input(event: InputEvent) -> void:
	if startCooking:
		if event is InputEventMouseButton && event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				var phonePos = Rect2($fryingPanMinigame/Pan/PanBottomRect.global_position, $fryingPanMinigame/Pan/PanBottomRect.size)
				if phonePos.has_point(event.position):
					taskSelected = true
					centerMouse = position - event.position 
			else:
				taskSelected = false
		elif event is InputEventMouse and taskSelected:
			position = event.position + centerMouse


func _sandwich_area_entered(area: Area2D) -> void:
	print("Flipped sandwich")
