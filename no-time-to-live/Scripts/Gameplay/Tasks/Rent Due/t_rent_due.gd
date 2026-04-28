extends Node2D

var taskSelected : bool = false
var centerMouse := Vector2.ZERO
var mouseInSignature = false

signal billTaskFailed

func _ready():
	$taskTimer.start()
	SignalManager.connect("gameEnd", _end_game_call)

func _end_game_call():
	$".".queue_free()

func _on_timer_timeout() -> void:
	billTaskFailed.emit()
	$".".queue_free()

func _process(_delta):
	if $".".global_position.x < 0:
		$".".global_position = Vector2(1, $".".global_position.y)
	if $".".global_position.y < 0:
		$".".global_position = Vector2($".".global_position.x, 1)

	if $".".global_position.x > 1700:
		$".".global_position = Vector2(1700, $".".global_position.y)
	if $".".global_position.y > 685:
		$".".global_position = Vector2( $".".global_position.x, 685)

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton && event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			var billPos = Rect2($ColorRect.global_position, $ColorRect.size)
			if billPos.has_point(event.position) && !mouseInSignature:
				taskSelected = true
				centerMouse = position - event.position 
		else:
			taskSelected = false
	elif event is InputEventMouse and taskSelected:
		position = event.position + centerMouse


func _on_area_2d_mouse_entered() -> void:
	mouseInSignature = true


func _on_area_2d_mouse_exited() -> void:
	mouseInSignature = false
