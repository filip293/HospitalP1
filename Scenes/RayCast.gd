extends RayCast3D

var hasKeycard = false
var ElectricDoorOpen = false
var doorNotOpen = true
var first = true
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if is_colliding():
		var detected = get_collider()
		# Check if the detected object has the 'get_prompt' method
		if detected.has_method("get_prompt"):
			Global.ObjectColliding = detected.get_prompt()
		else:
			Global.ObjectColliding = ""
	else:
		Global.ObjectColliding = ""
		
	#print(Global.ObjectColliding)
	
		
	if !Global.ObjectColliding == "":
		$/root/Node3D/VHS/Circle.modulate = Color(1, 1, 1, 1)
	else:
		$/root/Node3D/VHS/Circle.modulate = Color(1, 1, 1, 0.5)
			
	if "CardReader" in Global.ObjectColliding:
		if Input.is_action_pressed("interact") and hasKeycard == false:
			$/root/Node3D/Hospital/Sketchfab_model/Hospital_part1_low_FBX/RootNode/Hospital01/Hospital01_3m_0/Deny.play()
		elif Input.is_action_pressed("interact") and hasKeycard == true:
			$/root/Node3D/Hospital/Sketchfab_model/Hospital_part1_low_FBX/RootNode/Hospital01/Hospital01_3m_0/OmniLight3D.visible = true
			$/root/Node3D/Hospital/Sketchfab_model/Hospital_part1_low_FBX/RootNode/Hospital01/Hospital01_3m_0/Accept.play()
			ElectricDoorOpen = true
			
	if "Keycard" in Global.ObjectColliding:
		if Input.is_action_pressed("interact"):
			hasKeycard = true
			if $/root/Node3D/Keycard != null:
				$/root/Node3D/Keycard.free()
				
	if ElectricDoorOpen == true and doorNotOpen == true:
		$/root/Node3D/Hospital/Sketchfab_model/Hospital_part1_low_FBX/RootNode/door6_SM001/ElectricDoor.play()
		$/root/Node3D/Hospital/Sketchfab_model/Hospital_part1_low_FBX/RootNode/door6_SM001/Animation.play("DoorOpen")
		doorNotOpen = false
		await Global.calltime(3)
		Global.secondstart = true
		#$"../../../../Hospital/Sketchfab_model/Hospital_part1_low_FBX/RootNode/Hospital01/Hospital01_26m_1/TenseUp".play()
		#Global.secondplay = true		 #Code for tense then just no sound
		#$/root/Node3D/Player/Ambiant.stop()
		
	if "Crowbar" in Global.ObjectColliding:
		if Input.is_action_pressed("interact"):
			Global.has_crowbar = true
			$Crowbar.queue_free()
			$/root/Node3D/Hospital/Sketchfab_model/Hospital_part1_low_FBX/RootNode/door3_SM008/StaticBody3D2/CollisionShape3D.disabled = false
			
	if "Unopened" in Global.ObjectColliding:
		if Input.is_action_pressed("interact"):
			pass
			
		
			


func _on_area_3d_body_entered(body):
	if first:
		randomize()

		var random_choice = randi() % 4
		first = false
		match random_choice:
			0:
				$"../../../Dead/Sketchfab_model/deadbodies_FBX/RootNode/body3/IDDI".play()
			1:
				$"../../../Dead/Sketchfab_model/deadbodies_FBX/RootNode/body3/IWM".play()
			2:
				$"../../../Dead/Sketchfab_model/deadbodies_FBX/RootNode/body3/IWT".play()
			3:
				$"../../../Dead/Sketchfab_model/deadbodies_FBX/RootNode/body3/TFM".play()
