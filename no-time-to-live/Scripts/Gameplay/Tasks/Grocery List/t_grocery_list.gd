extends Node2D

var groceryList : Array = ["Scrub Daddy", "Watermelon", "Ketchup", "Potato", "Soda", "Chips", "Medication", "Tomato", "Romaine Lettuce", "Spaghetti", "Macaroni", "Ribs", "Pork Chops", "Oranges", "Bananas", "Soap", "Laundry Detergent", "Coffee", "Beer", "Peas"]
var groceryNum = []
var taskSelected : bool = false
var centerMouse := Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	_random_grocery_generator()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if $".".global_position.x < 0:
		$".".global_position = Vector2(1, $".".global_position.y)
	if $".".global_position.y < 0:
		$".".global_position = Vector2($".".global_position.x, 1)

	if $".".global_position.x > 1500:
		$".".global_position = Vector2(1500, $".".global_position.y)
	if $".".global_position.y > 720:
		$".".global_position = Vector2( $".".global_position.x, 720)

func 	_random_grocery_generator():
	while(groceryNum.size() < 8):
		var randomGrocery = randi_range(0, 19)
		if(groceryNum.find(groceryList[randomGrocery]) == -1):
			groceryNum.append(groceryList[randomGrocery])
	
	$stickyLabel1.text = groceryNum[0]
	$stickyLabel2.text = groceryNum[1]
	$stickyLabel3.text = groceryNum[2]
	$stickyLabel4.text = groceryNum[3]
	$stickyLabel5.text = groceryNum[4]
	$stickyLabel6.text = groceryNum[5]
	$stickyLabel7.text = groceryNum[6]
	$stickyLabel8.text = groceryNum[7]


func _submit_button_pressed() -> void:
	if($stickyCheck1.is_pressed() && $stickyCheck2.is_pressed() && $stickyCheck3.is_pressed() && $stickyCheck4.is_pressed() && $stickyCheck5.is_pressed() && $stickyCheck6.is_pressed() && $stickyCheck7.is_pressed() && $stickyCheck8.is_pressed()):
		SignalManager.emit_signal("completedGroceryTask")
		print("test")
		
func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton && event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			var phonePos = Rect2($".".global_position, $ColorRect.size)
			if phonePos.has_point(event.position):
				taskSelected = true
				centerMouse = position - event.position 
		else:
			taskSelected = false
	elif event is InputEventMouse and taskSelected:
		position = event.position + centerMouse
