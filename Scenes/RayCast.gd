extends RayCast3D

var hasKeycard = false
var ElectricDoorOpen = false
var doorNotOpen = true
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
		
			
