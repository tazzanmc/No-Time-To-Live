extends ProgressBar

@onready var timer = $socialBarChange/socialBarTimer
@onready var socialBarChange = $socialBarChange
@onready var runTimer = $RunLengthTimer

var socialHealth = 100 : set  = _setSocial

func _setSocial(newSocialValue):
	var prevSocial = socialHealth
	socialHealth = min(max_value, newSocialValue)
	value = socialHealth
	if socialHealth >= 0:
		print("yay")
		#queue_free()
	if socialHealth < prevSocial:
		timer.start
	else:
		socialBarChange.value = socialHealth

func intHealth(_socialHealth):
		socialHealth = _socialHealth
		max_value = socialHealth
		value = socialHealth
		socialBarChange.max_value = socialHealth
		socialBarChange.value = socialHealth

func onSocialBarTimerTimout() -> void:
	socialBarChange.value = socialHealth

func barDegredation():
	pass


func _on_timer_time_change_signal(timeElapsed: Variant) -> void:
	if(fmod(timeElapsed, 3) == 0):
		_setSocial(socialHealth - 50)
