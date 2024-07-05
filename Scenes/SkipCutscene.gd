extends Node2D
var timer: float
var TPB
var runonce = false
var runonce2 = true
var stop = false
# Called when the node enters the scene tree for the first time.

func _ready():
	modulate = Color(1, 1, 1, 0)
	TPB = $TextureProgressBar
	TPB.value = 0

func _input(event):
	if Input.is_key_pressed(KEY_F) and Global.cutscene_started:
		runonce = true
		TPB.value += 2
		
func _process(delta):
	if runonce and runonce2:
		waitforcall()
	if TPB.value >= 100 and !stop:
		Global.skip_cutscene()
		wegobyebye()
		stop = true
	if TPB.value > 0 and !Input.is_key_pressed(KEY_F):
		TPB.value -= 1

func waitforcall():
	$AnimationPlayer.play("Fade_In")
	print("anim called")
	runonce2 = false

func wegobyebye():
	$AnimationPlayer.play("Fade_Out")
	await $AnimationPlayer.animation_finished
	await Global.cutsceneskipped
	queue_free()
