extends AnimationPlayer

var first = true
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
		$/root/Node3D/Rat/AnimationP.play("Rat")
		first = false
