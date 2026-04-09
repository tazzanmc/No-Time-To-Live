extends Node2D

var taskSelected : bool = false
var centerMouse := Vector2.ZERO
var SSN
var month
var day
var year
var bossDescriptor = ["Sexy", "Godly", "Suave", "Benevolent", "Breathtaking", "Chivalrous", "Effervescent", "Fortitudinous", "Mesmerizing", "Super­cali­fragilistic­expiali­docious"]
var bossDescIndex = randi_range(0, 9)

func _ready():
	_random_answer_generator()

func _process(_delta):
	if $".".global_position.x < 0:
		$".".global_position = Vector2(1, $".".global_position.y)
	if $".".global_position.y < 0:
		$".".global_position = Vector2($".".global_position.x, 1)

	if $".".global_position.x > 1495:
		$".".global_position = Vector2(1495, $".".global_position.y)
	if $".".global_position.y > 545:
		$".".global_position = Vector2( $".".global_position.x, 545)


func _random_answer_generator():
	SSN = randi_range(111111111, 999999999)
	month = randi_range(1, 12)
	year = randi_range(1950, 2015)
	
	if(month == 2):
		day = randi_range(1, 28)
	elif(month % 2):
		day = randi_range(1, 30)
	else:
		day = randi_range(1, 31)

	$SocialSecurityAnswerLabel.text = str(SSN)
	$DOBAnswerLabel.text = str(month) + " / " + str(day) + "/ " + str(year)
	$DescribeAnswerLabel.text = bossDescriptor[bossDescIndex]

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton && event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			var appPos = Rect2($".".global_position, $ColorRect.size)
			if appPos.has_point(event.position):
				taskSelected = true
				centerMouse = position - event.position 
		else:
			taskSelected = false
	elif event is InputEventMouse and taskSelected:
		position = event.position + centerMouse

func _submit_information():
	if($SocialSecurityField.text == str(SSN)):
		$SocialSecurityAnswerLabel.text = "Yay!"
	else:
		$SocialSecurityAnswerLabel.text = "No!"
	
	if($DOBField.text == str(month) + " / " + str(day) + "/ " + str(year) ):
		$DOBAnswerLabel.text = "Yay!"
	else:
		$DOBAnswerLabel.text = "No!"
	
	if($BossDescriptorField.text == bossDescriptor[bossDescIndex]):
		$DescribeAnswerLabel.text = "Yay!"
	else:
		$DescribeAnswerLabel.text = "No!"
		
		SignalManager.emit("correctJobInfoSubmittion")
