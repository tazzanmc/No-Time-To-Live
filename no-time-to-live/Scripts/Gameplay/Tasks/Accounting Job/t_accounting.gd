extends task_generic

@export var equationArray : Array[int]

func _ready() -> void:
	var num1 = 0
	var num2 = 0
	var x = 0
	while x < 17:
		equationArray[x] = randi_range(0, 20)
		equationArray[x + 1] = randi_range(0,20)
		equationArray[x + 2] = equationArray[x] + equationArray[x + 1]
		print(equationArray[x])
		print(equationArray[x + 1])
		print(equationArray[x + 2])
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

func _on_line_edit_text_submitted(new_text: String) -> bool:
	if(str(equationArray[0] + equationArray[1]) == new_text):
		print("true")
		return true
	print("false")
	return false
