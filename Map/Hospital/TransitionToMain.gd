extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_3d_body_entered(body):
	Global.can_move = false
	$/root/Node3D/Player/Fade2.play("FadeIn")
	await get_tree().create_timer(2).timeout
	$/root/Node3D/Player.set_global_position(Vector3 (42, 1, -37))
	await get_tree().create_timer(5).timeout
	$/root/Node3D/Player/Fade2.play("FadeOut")
	Global.can_move = true
	Global.first_scene = false
	$/root/Node3D/VHS.visible = false
	if $/root/Node3D/HospitalScene/Wind.is_playing() == true:
		$/root/Node3D/HospitalScene/Wind.stop()
