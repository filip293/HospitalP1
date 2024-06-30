extends Node3D

var DoorClosed = true
var DoorMoving = false

func _process(delta):
	if "Door3" in Global.ObjectColliding and not DoorMoving:
		if DoorClosed and Input.is_action_pressed("interact"):
			DoorMoving = true
			$Animation.play("DoorOpen")
			$DoorOpen.play()
			await get_tree().create_timer(2).timeout
			DoorClosed = false
			DoorMoving = false
		elif not DoorClosed and Input.is_action_pressed("interact"):
			DoorMoving = true
			$Animation.play("DoorClose")
			$DoorClose.play()
			await get_tree().create_timer(0.5).timeout
			DoorClosed = true
			DoorMoving = false
