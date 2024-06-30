extends Camera3D

var mouse_sensitivity = 0.1
@onready var camera = $"."


func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED and current:
		var rotation_y = deg_to_rad(-event.relative.x * mouse_sensitivity)  # Invert the x-axis rotation here
		self.rotate_y(rotation_y)

		var camera_rot = camera.rotation_degrees
		
		var rotation_to_apply_on_x_axis = event.relative.y * mouse_sensitivity  # Invert the y-axis rotation here

		camera_rot.x = clamp(camera_rot.x - rotation_to_apply_on_x_axis, -90, 70)
		camera.rotation_degrees = camera_rot

		var global_rot = self.rotation_degrees
		global_rot.y = clamp(global_rot.y, -175, -110)
		self.rotation_degrees = global_rot
