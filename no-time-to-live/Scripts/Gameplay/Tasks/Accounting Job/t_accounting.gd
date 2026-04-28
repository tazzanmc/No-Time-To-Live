extends task_generic

@export var equationArray : Array[int]
var lineSumBool1 = false
var lineSumBool2 = false
var lineSumBool3 = false
var lineSumBool4 = false
var lineSumBool5 = false
var lineSumBool6 = false
var completedTask = false

func _ready() -> void:
	var num1 = 0
	var num2 = 0
	var x = 0
	$Timer.start()
	while x < 17:
		equationArray[x] = randi_range(0, 20)
		equationArray[x + 1] = randi_range(0,20)
		equationArray[x + 2] = equationArray[x] + equationArray[x + 1]
		x += 3
		$Label2.text = "Account one: " + str(equationArray[0]) + " + " + str(equationArray[1]) + " ="
		$Label3.text = "Account two: " + str(equationArray[3]) + " + " + str(equationArray[4]) + " ="
		$Label4.text = "Account three: " + str(equationArray[6]) + " + " + str(equationArray[7]) + " ="
		$Label5.text = "Account four: " + str(equationArray[9]) + " + " + str(equationArray[10]) + " ="
		$Label6.text = "Account five: " + str(equationArray[12]) + " + " + str(equationArray[13]) + " ="
		$Label7.text = "Account six: " + str(equationArray[15]) + " + " + str(equationArray[16]) + " ="

func _process(_delta):
	if $".".global_position.x < 0:
		$".".global_position = Vector2(1, $".".global_position.y)
	if $".".global_position.y < 0:
		$".".global_position = Vector2($".".global_position.x, 1)

	if $".".global_position.x > 1495:
		$".".global_position = Vector2(1495, $".".global_position.y)
	if $".".global_position.y > 545:
		$".".global_position = Vector2( $".".global_position.x, 545)
	


func _on_line_edit_text_submitted(new_text: String) -> void:
	$CheckmarkSprite.hide()
	$CrossSprite.hide()
	
	if(str(equationArray[0] + equationArray[1]) == new_text):
		lineSumBool1 = true
		$AudioPlayerCorrect.play()
		$CheckmarkSprite.show()
	else:
		$AudioPlayerIncorrect.play()
		$CrossSprite.show()
		
	if(lineSumBool1 && lineSumBool2 && lineSumBool3 && lineSumBool4 && lineSumBool5 && lineSumBool6): 
		SignalManager.completedAccounting.emit()
		completedTask = true 
		$".".queue_free()


func _on_line_edit_2_text_submitted(new_text: String) -> void:
	$CheckmarkSprite2.hide()
	$CrossSprite2.hide()
	if(str(equationArray[3] + equationArray[4]) == new_text):
		lineSumBool2 = true
		$AudioPlayerCorrect.play()
		$CheckmarkSprite2.show()
	else:
		$AudioPlayerIncorrect.play()
		$CrossSprite2.show()
		
	if(lineSumBool1 && lineSumBool2 && lineSumBool3 && lineSumBool4 && lineSumBool5 && lineSumBool6): 
		SignalManager.completedAccounting.emit()
		$".".queue_free()

func _on_line_edit_3_text_submitted(new_text: String) -> void:
	$CheckmarkSprite3.hide()
	$CrossSprite3.hide()
	if(str(equationArray[6] + equationArray[7]) == new_text):
		lineSumBool3 = true
		$AudioPlayerCorrect.play()
		$CheckmarkSprite3.show()
	else:
		$AudioPlayerIncorrect.play()
		$CrossSprite3.show()
		
	if(lineSumBool1 && lineSumBool2 && lineSumBool3 && lineSumBool4 && lineSumBool5 && lineSumBool6): 
		SignalManager.completedAccounting.emit()
		$".".queue_free()

func _on_line_edit_4_text_submitted(new_text: String) -> void:
	$CheckmarkSprite4.hide()
	$CrossSprite4.hide()
	if(str(equationArray[9] + equationArray[10]) == new_text):
		lineSumBool4 = true
		$AudioPlayerCorrect.play()
		$CheckmarkSprite4.show()
	else:
		$AudioPlayerIncorrect.play()
		$CrossSprite4.show()
	if(lineSumBool1 && lineSumBool2 && lineSumBool3 && lineSumBool4 && lineSumBool5 && lineSumBool6): 
		SignalManager.completedAccounting.emit()
		$".".queue_free()

func _on_line_edit_5_text_submitted(new_text: String) -> void:
	$CheckmarkSprite5.hide()
	$CrossSprite5.hide()
	if(str(equationArray[12] + equationArray[13]) == new_text):
		lineSumBool5 = true
		$AudioPlayerCorrect.play()
		$CheckmarkSprite5.show()
	else:
		$AudioPlayerIncorrect.play()
		$CrossSprite5.show()
	if(lineSumBool1 && lineSumBool2 && lineSumBool3 && lineSumBool4 && lineSumBool5 && lineSumBool6): 
		SignalManager.completedAccounting.emit()
		$".".queue_free()

func _on_line_edit_6_text_submitted(new_text: String) -> void:
	$CheckmarkSprite6.hide()
	$CrossSprite6.hide()
	if(str(equationArray[15] + equationArray[16]) == new_text):
		lineSumBool6 = true
		$AudioPlayerCorrect.play()
		$CheckmarkSprite6.show()
	else:
		$AudioPlayerIncorrect.play()
		$CrossSprite6.show()
	if(lineSumBool1 && lineSumBool2 && lineSumBool3 && lineSumBool4 && lineSumBool5 && lineSumBool6): 
		SignalManager.completedAccounting.emit()
		$".".queue_free()

func _on_timer_timeout() -> void:
	if(!completedTask):
		SignalManager._disable_job_pool()
		$".".queue_free()
