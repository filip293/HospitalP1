extends Node3D

var DoorClosed = true
var DoorMoving = false
var first = true

@onready var sparks = $"../Hospital01/Hospital01_20m_0/VFX/Sparks"
@onready var flush = $"../Hospital01/Hospital01_20m_0/VFX/Flush"
@onready var smoke = $"../Hospital01/Hospital01_20m_0/VFX/Smoke"
@onready var fire = $"../Hospital01/Hospital01_20m_0/VFX/Fire"

func _process(delta):
	if "Door2" in Global.ObjectColliding and not DoorMoving:
		if DoorClosed and Input.is_action_pressed("interact"):
			DoorMoving = true
			$Animation.play("DoorOpen2")
			$OpenDoor2.play()
			await Global.calltime(4.8)
			DoorClosed = false
			DoorMoving = false
			
			if first:
				first = false
				await Global.calltime(0.5)
				$/root/Node3D/Rat/RatSound.play()
				await Global.calltime(1.63)
				#Global.screenshake = true
				$"../Hospital01/Hospital01_20m_0/VFX/Explosion".play()
				$"../../../../../Player/MC/AnimationPlayer".play("DieBack")
				$"../../../../../Rat/AnimationP".play("Fly")
				fire.emitting = true
				smoke.emitting = true
				flush.emitting = true
				sparks.emitting = true
				await Global.calltime(1)
				$/root/Node3D/Player/Ambiant.volume_db = -20
				$/root/Node3D/Player/FootstepLeftSound.volume_db = -20
				$/root/Node3D/Player/FootstepRightSound.volume_db = -20
				$"../Hospital01/Hospital01_20m_0/VFX/EarRinging".play()
				await Global.calltime(10)
				$/root/Node3D/Player/Ambiant.volume_db = 0
				$/root/Node3D/Player/FootstepLeftSound.volume_db = 0
				$/root/Node3D/Player/FootstepRightSound.volume_db = 0
				$"../Hospital01/Hospital01_20m_0/VFX/EarRinging".stop()

			
			
		elif not DoorClosed and Input.is_action_pressed("interact"):
			DoorMoving = true
			$Animation.play("DoorClose2")
			$CloseDoor2.play()
			await Global.calltime(2.1)
			DoorClosed = true
			DoorMoving = false
