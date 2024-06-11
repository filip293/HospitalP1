extends Node3D

var DoorClosed = true
var DoorMoving = false

func _process(delta):
	if "Door2" in Global.ObjectColliding and not DoorMoving:
		if DoorClosed and Input.is_action_pressed("interact"):
			DoorMoving = true
			$Animation.play("DoorOpen2")
			$OpenDoor2.play()
			await get_tree().create_timer(4.8).timeout
			DoorClosed = false
			DoorMoving = false
		elif not DoorClosed and Input.is_action_pressed("interact"):
			DoorMoving = true
			$Animation.play("DoorClose2")
			$CloseDoor2.play()
			await get_tree().create_timer(2.1).timeout
			DoorClosed = true
			DoorMoving = false
