extends CharacterBody3D

@onready var neck := $Neck


const speed = 2.0
var mouse_sensitivity = 0.1
var footstep_timer = 0.0				#used for honestly no idea (footstep timing)
var footstep_interval = 0.9				#used for footstep interval while walking\
var footstep_running_interval = 0.26	#used for footstep interval while sprinting

var is_right_foot = true
var can_move: bool = true


var footstep_left_sound: AudioStreamPlayer3D
var footstep_right_sound: AudioStreamPlayer3D


var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")


func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	footstep_left_sound = $FootstepLeftSound
	footstep_right_sound = $FootstepRightSound
	
	
func _unhandled_input(event: InputEvent) -> void:

	if event is InputEventMouseMotion and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		self.rotate_y(deg_to_rad(event.relative.x * mouse_sensitivity * -1))
		
		var camera_rot = neck.rotation_degrees
		var rotation_to_apply_on_x_axis = (-event.relative.y * mouse_sensitivity);
		rotation_to_apply_on_x_axis *= -1
		if (camera_rot.x + rotation_to_apply_on_x_axis < -90):
			camera_rot.x = -90
		elif (camera_rot.x + rotation_to_apply_on_x_axis > 70):
			camera_rot.x = 70
		else:
			camera_rot.x += rotation_to_apply_on_x_axis;
			neck.rotation_degrees = camera_rot
			
			
			
func get_input():
	var input = Input.get_vector("move_right", "move_left", "move_backward", "move_forward")
	var movement_dir = transform.basis * Vector3(input.x, 0, input.y)
	if can_move == true:
		velocity.x = movement_dir.x * speed
		velocity.z = movement_dir.z * speed
	if input:
		if input.y>0 or input.x>0:
			$Neck/Animations.play("head bob")
		elif input.y<0 or input.x<0:
			$Neck/Animations.play("head bob")
		else:
			$Neck/Animations.stop()
	elif can_move == false: 
		velocity.x = 0
		velocity.z = 0
		
	if Input.is_action_pressed("esc"):
		get_tree().quit()
		
		
func _physics_process(delta):

	velocity.y += -gravity * delta
	get_input()
	move_and_slide()
	
	var moving_forward = Input.get_action_strength("move_forward") > 0
	var moving_right = Input.get_action_strength("move_right") > 0
	var moving_backward = Input.get_action_strength("move_backward") > 0
	var moving_left = Input.get_action_strength("move_left") > 0
	
	var moving = moving_forward or moving_right or moving_left or moving_backward
	
	if can_move == true:
		if moving:
			footstep_timer += delta
			if footstep_timer >= footstep_interval:
				footstep_timer = 0.0
				if is_right_foot:
					footstep_right_sound.play()
				else:
					footstep_left_sound.play()
				is_right_foot = !is_right_foot
		elif can_move == false:
			pass
