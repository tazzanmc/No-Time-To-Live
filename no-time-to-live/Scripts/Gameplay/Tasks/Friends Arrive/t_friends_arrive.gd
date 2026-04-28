extends Node2D

var taskActive = false

func _ready() -> void:
	$pauseSocialBar.start()
	$friendTimer.start()
	$AudioStreamPlayer2D.play()
	SignalManager.pauseSocialBarSignal.emit()
	$RigidBody2D/friends/pixelSprite2D.show()
	$RigidBody2D/friends/pixelSprite2D2.show()
	$RigidBody2D/friends/pixelSprite2D3.show()
	SignalManager.connect("gameEnd", _end_game_call)
	SignalManager.friendsActive()

func _end_game_call():
	$".".queue_free()

func _process(float)->void:
	if($RigidBody2D.position.y > 550):
		$RigidBody2D.linear_velocity.y = -600
	$RigidBody2D.rotation = 0
	$RigidBody2D.position.x = 0


func _on_pause_social_bar_timeout() -> void:
	SignalManager.unpauseSocialBarSignal.emit()


func _on_friend_timer_timeout() -> void:
	SignalManager.friendsDeactivated()
	$".".queue_free()
