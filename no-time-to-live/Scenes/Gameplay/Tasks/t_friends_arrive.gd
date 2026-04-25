extends Node2D

func _ready() -> void:
	$pauseSocialBar.start()
	SignalManager.pauseSocialBarSignal.emit()
	$RigidBody2D/ColorRect.show()

func _process(float)->void:
	if($RigidBody2D.position.y > 400):
		$RigidBody2D.linear_velocity.y = -400

func _on_pause_social_bar_timeout() -> void:
	SignalManager.unpauseSocialBarSignal.emit()


func _on_friend_timer_timeout() -> void:
	$RigidBody2D/ColorRect.hide()
