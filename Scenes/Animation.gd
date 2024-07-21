extends AnimationPlayer

var first = true
var first2 = true
# Called when the node enters the scene tree for the first time.
func _ready():
	$".".play("Flicker1")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $/root/Node3D/Rat/AnimationP.is_playing():
		if !$/root/Node3D/Rat/AnimationPlayer.is_playing():
			$/root/Node3D/Rat/AnimationPlayer.play("RatArmature|Rat_Run")


func _on_area_3d_rat_entered(body):
	if first:
		$"../../Hospital01_26m_1/Tense".play()
		first = false


func _on_area_3d_2_body_entered(body):
	if first2:
		$/root/Node3D/Rat/AnimationP.play("Rat")
		first2 = false
