extends Node3D

var postProcess = load("res://Scenes/PostProcess.tres")
var rotation_angle = deg_to_rad(0)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_3d_body_entered(body):
	Global.can_move = false
	$/root/Node3D/Player/Fade2.play("FadeIn")
	await Global.calltime(2)
	$/root/Node3D/Player.set_global_position(Vector3 (42, 1, -37))
	$/root/Node3D/Player.rotation.y = rotation_angle
	await Global.calltime(5)
	$/root/Node3D/Player/Fade2.play("FadeOut")
	Global.can_move = true
	Global.first_scene = false
	Global.can_move = false
	if $/root/Node3D/HospitalScene/Wind.is_playing() == true:
		$/root/Node3D/HospitalScene/Wind.stop()
		
	await Global.calltime(5)
	$/root/Node3D/Player/MC/CameraTrans.play("CameraTrans")
	Global.timestart = true
	await Global.calltime(3.3)
	$/root/Node3D/Player/SubViewport.queue_free()
	postProcess.CRT = true
	$/root/Node3D/VHS.visible = true
	Global.can_move = true
