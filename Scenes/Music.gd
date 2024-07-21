extends Node3D

var first = true
var first2 = true
var notrans = true
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $Dripping.is_playing() == false:
		$Dripping.play()
	
	if $/root/Node3D/TitleScreen/Path3D/PathFollow3D/Node3D/Camera3D.is_current() and $/root/Node3D/HospitalScene/Wind.is_playing() == false and Global.titlescreen == true:
		$/root/Node3D/HospitalScene/Wind.play()
	elif Global.titlescreen == false and notrans == true:
		$/root/Node3D/HospitalScene/Wind.stop()
		notrans = false
		
		
	if $/root/Node3D/Player/Ambiant.is_playing() == false and Global.first_scene == false and Global.titlescreen == false and Global.otherplay == false:
		$/root/Node3D/Player/Ambiant.play()
		
	if $Buzz4.is_playing() == false and Global.first_scene == false and Global.titlescreen == false:
		$Buzz4.play()
		$Buzz8.play()
		
		
	if Global.power == true and $Buzz6.is_playing() == false:
		$Buzz9.play()
		$Buzz10.play()
		$Buzz11.play()
		$Buzz6.play()
		$Buzz7.play()
		$Buzz.play()
		$Buzz2.play()
		$Buzz3.play()
		
		if $Buzz5 != null:
			$Buzz5.play()
		
		
func _on_area_3d_body_entered_Room1(body):
	if first and Global.error_time == true:
		$/root/Node3D/MusicBox/MusicBox.play()
		first = false
	
func _on_up_stairs(body):
	if first2 == true:
		$/root/Node3D/PTLC/Wheelchair2/Animation.play("ChairMove")
		first2 = false
