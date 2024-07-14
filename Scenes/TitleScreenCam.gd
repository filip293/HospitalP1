extends Camera3D

var last_position = Vector2()
var sensitivity = 0.001
var camera_rot = Vector2(0, 0)

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _input(event):
	if event is InputEventMouseMotion and current:
		var delta = event.relative
		camera_rot.y += -delta.x * sensitivity
		camera_rot.x += -delta.y * sensitivity

		camera_rot.x = clamp(camera_rot.x, -90, 90)

		rotation_degrees.y = camera_rot.y
		rotation_degrees.x = camera_rot.x
