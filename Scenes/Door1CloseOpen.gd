extends Node3D

var DoorClosed = true
var DoorMoving = false

func _process(delta):
	if "Door1" in Global.ObjectColliding and not DoorMoving:
		if DoorClosed and Input.is_action_pressed("interact"):
			DoorMoving = true
			$Animation.play("DoorOpen")
			$DoorOpen.play()
			await Global.calltime(2)
			DoorClosed = false
			DoorMoving = false
		elif not DoorClosed and Input.is_action_pressed("interact"):
			DoorMoving = true
			$Animation.play("DoorClose")
			$DoorClose.play()
			await Global.calltime(0.5)
			DoorClosed = true
			DoorMoving = false

