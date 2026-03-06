extends Label

@onready var timer: Label = $"TimeChangeSignal"



var timeElapsed := 0.0
var secondsCheck = 0

signal timeChangeSignal(timeElapsed)

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	timeElapsed += delta
	var minutes := timeElapsed / 60
	var seconds := fmod(timeElapsed, 60)
	var timeString := "%02d : %02d" % [minutes, seconds]
	text = timeString
	if(seconds != secondsCheck):
		timeChangeSignal.emit(timeElapsed)
