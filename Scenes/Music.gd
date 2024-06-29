extends Node3D

var first = true
var first2 = true
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $Dripping.is_playing() == false:
		$Dripping.play()
		
	if $/root/Node3D/Player/Ambiant.is_playing() == false and Global.first_scene == false and Global.titlescreen == false:
		$/root/Node3D/Player/Ambiant.play()
		
	if $Buzz.is_playing() == false and Global.first_scene == false and Global.titlescreen == false:
		$Buzz.play()
		$Buzz2.play()
		$Buzz3.play()
		$Buzz4.play()
		$Buzz5.play()
		$Buzz6.play()
		$Buzz7.play()
		$Buzz8.play()
		


func _on_area_3d_body_entered_Room1(body):
	if first and Global.error_time == true:
		$/root/Node3D/MusicBox/MusicBox.play()
		first = false
	
func _on_up_stairs(body):
	if first2 == true:
		$/root/Node3D/PTLC/Wheelchair2/Animation.play("ChairMove")
		first2 = false
