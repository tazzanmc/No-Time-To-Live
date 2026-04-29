extends Node2D

var taskActive = false

func _ready() -> void:
	$pauseSocialBar.start()
	$friendTimer.start()
	$AudioStreamPlayer2D.play()
	SignalManager.pauseSocialBarSignal.emit()
	$friends/pixelSprite2D.show()
	$friends/pixelSprite2D2.show()
	$friends/pixelSprite2D3.show()
	SignalManager.connect("gameEnd", _end_game_call)
	SignalManager.friendsActive()

func _end_game_call():
	$".".queue_free()



func _on_pause_social_bar_timeout() -> void:
	SignalManager.unpauseSocialBarSignal.emit()


func _on_friend_timer_timeout() -> void:
	SignalManager.friendsDeactivated()
	$".".queue_free()
