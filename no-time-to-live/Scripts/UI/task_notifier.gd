extends Node2D

#var timeLeft = $"../taskTimer".value
var current_angle = -1.6

var min_angle = -1.6
var max_angle = 4.7
var timeManager = 0
#
#func _start():
	#var timeManager = timeLeft
	#$TextureProgressBar.value = timeLeft
	

#func _process(delta):
	#if timeLeft != timeManager:
		#timeManager = timeLeft
		#
		#var value = ((min_angle * -1) + max_angle) / 100
		#current_angle = max_angle - (timeLeft * value)
		#$TextureProgressBarupdate.value = timeLeft
