extends Node3D

var DoorClosed = true
var DoorMoving = false
var first = true

@onready var sparks = $"../Hospital01/Hospital01_20m_0/VFX/Sparks"
@onready var flush = $"../Hospital01/Hospital01_20m_0/VFX/Flush"
@onready var smoke = $"../Hospital01/Hospital01_20m_0/VFX/Smoke"
@onready var fire = $"../Hospital01/Hospital01_20m_0/VFX/Fire"

func _process(delta):
	
	print(Global.ObjectColliding)
	if "Door2" in Global.ObjectColliding and not DoorMoving:
		if DoorClosed and Input.is_action_pressed("interact") and first == false:
			DoorMoving = true
			$Animation.play("DoorOpen2")
			$OpenDoor2.play()
			await Global.calltime(4.8)
			DoorClosed = false
			DoorMoving = false
			
		elif DoorClosed and Input.is_action_pressed("interact") and first:
			first = false
			DoorMoving = true
			$Animation.play("BudgeOpen")
			await Global.calltime(0.5)
			$"../../../../../Player/MC/CameraTrans".play("LookLeft")
			Global.can_move = false
			$/root/Node3D/Rat/RatSound.play()
			await Global.calltime(1.63)
			#Global.screenshake = true
			$"../Hospital01/Hospital01_20m_0/VFX/Explosion".play()
			#$"../../../../../Player/MC/AnimationPlayer".play("DieBack")
			$"../../../../../Rat/AnimationP".play("Fly")
			$"../Hospital01/Hospital01_20m_0/VFX/Sprite3D".visible = true
			fire.emitting = true
			smoke.emitting = true
			flush.emitting = true
			sparks.emitting = true
			await Global.calltime(1)
			DoorClosed = false
			DoorMoving = false
			$"../../../../../Player/MC/AnimationPlayer".play("DieBack")
			$"../../../../../Player/MC/CameraTrans".play("DieBackCamera")
			$/root/Node3D/Player/Ambiant.volume_db = -20
			$/root/Node3D/Player/FootstepLeftSound.volume_db = -20
			$/root/Node3D/Player/FootstepRightSound.volume_db = -20
			$"../Hospital01/Hospital01_20m_0/VFX/EarRinging".play()
			await Global.calltime(10)
			$/root/Node3D/Player/Ambiant.volume_db = 0
			$/root/Node3D/Player/FootstepLeftSound.volume_db = 0
			$/root/Node3D/Player/FootstepRightSound.volume_db = 0
			$"../Hospital01/Hospital01_20m_0/VFX/EarRinging".stop()

	if "Unopened" in Global.ObjectColliding:
		if Input.is_action_pressed("interact"):
			print("Execute")
			Global.can_move = false
			$"../../../../../Player/MC/CameraTrans".play("CrowbarHit")
			await Global.calltime(3.75)
			$Animation.play("Budge")
			Global.can_move = true
			await Global.calltime(1.25)
			$StaticBody3D2/CollisionShape3D.disabled = true
			$StaticBody3D/CollisionShape3D.disabled = false
