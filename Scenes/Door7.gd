extends Node3D

var DoorClosed = true
var DoorMoving = false

func _process(delta):
	if "Door7" in Global.ObjectColliding and not DoorMoving:
		if DoorClosed and Input.is_action_pressed("interact"):
			DoorMoving = true
			$Animation.play("DoorOpen")
			$OpenDoor2.play()
			await Global.calltime(4.8)
			DoorClosed = false
			DoorMoving = false
		elif not DoorClosed and Input.is_action_pressed("interact"):
			DoorMoving = true
			$Animation.play("DoorClose")
			$CloseDoor2.play()
			await Global.calltime(2.1)
			DoorClosed = true
			DoorMoving = false
