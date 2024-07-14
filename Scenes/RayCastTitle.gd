extends RayCast3D
var mouse_pos = Vector2()

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
	
	if "Mouse" in Global.ObjectColliding:
		print("HIT")
		
func _physics_process(delta):
	mouse_pos = get_viewport().get_mouse_position()
	position.x = -0.000625*mouse_pos.x+48.8
	position.y = -0.0005556*mouse_pos.y+36.2
	
	print(mouse_pos.x) 
