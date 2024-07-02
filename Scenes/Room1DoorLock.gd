extends Node3D

var notplaying = true
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if "Locked" in Global.ObjectColliding:
		if Input.is_action_pressed("interact") and notplaying == true:
			notplaying = false
			$Locked.play()
			await get_tree().create_timer(0.3).timeout
			$Locked.play()
			await get_tree().create_timer(0.3).timeout
			notplaying = true
