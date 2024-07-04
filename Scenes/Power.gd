extends MeshInstance3D




# Declare variables for button states
var button1_red = true
var button1_green = false
var button2_red = true
var button2_green = false
var button3_red = true
var button3_green = false
var button4_red = true
var button4_green = false
var button5_red = true
var button5_green = false
var button6_red = true
var button6_green = false
var first = true
var been = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$/root/Node3D/Hospital/Sketchfab_model/Hospital_part1_low_FBX/RootNode/Hospital01/Hospital01_3m_0/StaticBody3D/CollisionShape3D.disabled = true
	$OmniLight3D6.visible = false
	$OmniLight3D6/StaticBody3D/CollisionShape3D.disabled = true
	$OmniLight3D7.visible = false
	$OmniLight3D7/StaticBody3D/CollisionShape3D.disabled = true
	$OmniLight3D8.visible = false
	$OmniLight3D8/StaticBody3D/CollisionShape3D.disabled = true
	$OmniLight3D9.visible = false
	$OmniLight3D9/StaticBody3D/CollisionShape3D.disabled = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("interact"):
		if "Button1" in Global.ObjectColliding:
			if button1_red:
				$Button.play()
				$OmniLight3D.light_color = Color(0, 1, 0)  # Green
				button1_red = false
				button1_green = true
			elif button1_green:
				$Button.play()
				$OmniLight3D.light_color = Color(1, 0, 0)  # Red
				button1_red = true
				button1_green = false
		
		# Handle button2
		if "Button2" in Global.ObjectColliding:
			if button2_red:
				$Button.play()
				$OmniLight3D2.light_color = Color(0, 1, 0)  # Green
				button2_red = false
				button2_green = true
			elif button2_green:
				$Button.play()
				$OmniLight3D2.light_color = Color(1, 0, 0)  # Red
				button2_red = true
				button2_green = false

		# Handle button3
		if "Button3" in Global.ObjectColliding:
			if button3_red:
				$Button.play()
				$OmniLight3D6.light_color = Color(0, 1, 0)  # Green
				button3_red = false
				button3_green = true
			elif button3_green:
				$Button.play()
				$OmniLight3D6.light_color = Color(1, 0, 0)  # Red
				button3_red = true
				button3_green = false
		
		# Handle button4
		if "Button4" in Global.ObjectColliding:
			if button4_red:
				$Button.play()
				$OmniLight3D7.light_color = Color(0, 1, 0)  # Green
				button4_red = false
				button4_green = true
			elif button4_green:
				$Button.play()
				$OmniLight3D7.light_color = Color(1, 0, 0)  # Red
				button4_red = true
				button4_green = false

		# Handle button5
		if "Button5" in Global.ObjectColliding:
			if button5_red:
				$Button.play()
				$OmniLight3D8.light_color = Color(0, 1, 0)  # Green
				button5_red = false
				button5_green = true
			elif button5_green:
				$Button.play()
				$OmniLight3D8.light_color = Color(1, 0, 0)  # Red
				button5_red = true
				button5_green = false
		
		# Handle button6
		if "Button6" in Global.ObjectColliding:
			if button6_red:
				$Button.play()
				$OmniLight3D9.light_color = Color(0, 1, 0)  # Green
				button6_red = false
				button6_green = true
			elif button6_green:
				$Button.play()
				$OmniLight3D9.light_color = Color(1, 0, 0)  # Red
				button6_red = true
				button6_green = false

	# Handle button1 and button2 together
	if button1_green and button2_red:
		$OmniLight3D6.visible = true
		$OmniLight3D6/StaticBody3D/CollisionShape3D.disabled = false
		$OmniLight3D7.visible = true
		$OmniLight3D7/StaticBody3D/CollisionShape3D.disabled = false
		$OmniLight3D8.visible = true
		$OmniLight3D8/StaticBody3D/CollisionShape3D.disabled = false
		$OmniLight3D/StaticBody3D/CollisionShape3D.disabled = true
		$OmniLight3D2/StaticBody3D/CollisionShape3D.disabled = true

	# Handle buttons 3, 4, and 5
	if button3_green and button5_green and button4_red:
		$OmniLight3D9.visible = true
		$OmniLight3D9/StaticBody3D/CollisionShape3D.disabled = false
		
		# Disable collisions for OmniLights 6, 7, and 8
		$OmniLight3D6/StaticBody3D/CollisionShape3D.disabled = true
		$OmniLight3D7/StaticBody3D/CollisionShape3D.disabled = true
		$OmniLight3D8/StaticBody3D/CollisionShape3D.disabled = true
		
	if button6_green and first == true:
		$OmniLight3D9/StaticBody3D/CollisionShape3D.disabled = true
		$PowerOn.play()
		if $/root/Node3D/Hospital/Sketchfab_model/Hospital_part1_low_FBX/RootNode/Hospital01/Hospital01_3m_0/MeshInstance3D != null:
			$/root/Node3D/Hospital/Sketchfab_model/Hospital_part1_low_FBX/RootNode/Hospital01/Hospital01_3m_0/MeshInstance3D.queue_free()
		$/root/Node3D/Hospital/Sketchfab_model/Hospital_part1_low_FBX/RootNode/Hospital01/Hospital01_3m_0/StaticBody3D/CollisionShape3D.disabled = false
		first = false
		await Global.calltime(1)
		$/root/Node3D/Hospital/Sketchfab_model/Hospital_part1_low_FBX/RootNode/Hospital01/Hospital01_44m_1/SpotLight3D3/AnimationP.play("TurnOn")
		Global.power = true
		Global.can_move = false
		$Camera3D.make_current()
		$AnimationP.play("Lights")
		await Global.calltime(13)
		$"../../../../../../Player/Neck/Camera3D".make_current()
		Global.can_move = true


func _on_area_3d_body_entered(body):
	if been == false and Global.power == false:
		Global.can_move = false
		await Global.calltime(5)
		#DIALOGUEHERE
		$Camera3D.make_current()
		been = true
		await Global.calltime(2)
		$"../../../../../../Player/Neck/Camera3D".make_current()
		Global.can_move = true
