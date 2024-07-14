extends Node3D

var DoorClosed = true
var DoorMoving = false

func _process(delta):
	if "Door6" in Global.ObjectColliding and not DoorMoving:
		if DoorClosed and Input.is_action_pressed("interact"):
			DoorMoving = true
			$Animation.play("DoorOpen")
			await Global.calltime(4.8)
			DoorClosed = false
			DoorMoving = false
		elif not DoorClosed and Input.is_action_pressed("interact"):
			DoorMoving = true
			$Animation.play("DoorClose")
			await Global.calltime(2.1)
			DoorClosed = true
			DoorMoving = false
