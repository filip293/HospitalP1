extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("esc") and Global.menuopen == false and Global.titlescreen == false:
		$AnimationP.play("MenuOpen")
		$/root/Node3D/VHS/Circle.visible = false
		Global.menuopen = true
		Input.set_mouse_mode(Input.MOUSE_MODE_CONFINED)
	elif Input.is_action_just_pressed("esc") and Global.menuopen == true and Global.titlescreen == false:
		$AnimationP.play("MenuClose")
		$/root/Node3D/VHS/Circle.visible = true
		Global.menuopen = false
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func _on_exit_pressed():
	get_tree().quit()


func _on_close_pressed():
	$AnimationP.play("MenuClose")
	Global.menuopen = false
	$/root/Node3D/VHS/Circle.visible = true
	if Global.titlescreen == true:
		$/root/Node3D/TitleScreen/Path3D/PathFollow3D/Node3D/RayCast3D.enabled = true
	if Global.titlescreen == false:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
