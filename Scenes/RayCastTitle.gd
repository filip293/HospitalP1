extends RayCast3D
var mouse_pos = Vector2()
var StartSoundPlayed = false
var OptionsSoundPlayed = false
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
	
	if "Start" in Global.ObjectColliding:
		if $/root/Node3D/TitleScreen/ButtonHover.is_playing() == false and StartSoundPlayed == false:
			$/root/Node3D/TitleScreen/ButtonHover.play()
			StartSoundPlayed = true
		$/root/Node3D/TitleScreen/Start/Start.modulate = Color(0.54, 0.54, 0.54)
	else:
		$/root/Node3D/TitleScreen/Start/Start.modulate = Color(1, 1, 1)
		StartSoundPlayed = false
		
	if "Options" in Global.ObjectColliding:
		if $/root/Node3D/TitleScreen/ButtonHover.is_playing() == false and OptionsSoundPlayed == false:
			$/root/Node3D/TitleScreen/ButtonHover.play()
			OptionsSoundPlayed = true
		$/root/Node3D/TitleScreen/Options/Options.modulate = Color(0.54, 0.54, 0.54)
	else:
		$/root/Node3D/TitleScreen/Options/Options.modulate = Color(1, 1, 1)
		OptionsSoundPlayed = false
		
	if "Options" in Global.ObjectColliding and Input.is_action_just_pressed("Click"):
		$/root/Node3D/TitleScreen/AnimationP.play("OptionGo")
		if $/root/Node3D/TitleScreen/ButtonClick.is_playing() == false:
			$/root/Node3D/TitleScreen/ButtonClick.play()
		
	if "Start" in Global.ObjectColliding and Input.is_action_pressed("Click"):
		Global.first_scene = true
		if $/root/Node3D/TitleScreen/ButtonClick.is_playing() == false:
			$/root/Node3D/TitleScreen/ButtonClick.play()
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		await Global.calltime(3)
		Global.titlescreen = false
		
func _physics_process(delta):
	mouse_pos = get_viewport().get_mouse_position()
	position.x = -0.000625*mouse_pos.x+48.8
	position.y = -0.0005556*mouse_pos.y+36.2
