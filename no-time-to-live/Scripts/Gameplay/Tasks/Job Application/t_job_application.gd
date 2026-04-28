extends task_generic

var SSN : int
var month : int
var day : int
var year : int
var bossDescriptor : Array = ["Sexy", "Godly", "Suave", "Benevolent", "Breathtaking", "Chivalrous", "Effervescent", "Fortitudinous", "Mesmerizing", "Super­cali­fragilistic­expiali­docious"]
var bossDescIndex : int = randi_range(0, 9)

func _ready():
	_random_answer_generator()
	SignalManager.connect("gameEnd", _end_game_call)

func _end_game_call():
	$".".queue_free()

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
	$DOBAnswerLabel.text = str(month) + "/" + str(day) + "/" + str(year)
	$DescribeAnswerLabel.text = bossDescriptor[bossDescIndex]

func _submit_information():
	var helper : int = 0
	if($SocialSecurityField.text == str(SSN)):
		helper += 1
		$SocialSecurityAnswerLabel.text = "Yay!"
	else:
		$SocialSecurityAnswerLabel.text = "No!"
	
	if($DOBField.text == str(month) + "/" + str(day) + "/" + str(year) ):
		helper += 1
		$DOBAnswerLabel.text = "Yay!"
	else:
		$DOBAnswerLabel.text = "No!"
	
	if($BossDescriptorField.text == bossDescriptor[bossDescIndex]):
		helper += 1
		$DescribeAnswerLabel.text = "Yay!"
	else:
		$DescribeAnswerLabel.text = "No!"
	
	if helper >= 3:
		SignalManager.correctJobInfoSubmission.emit()
		win()
	else:
		fail()
