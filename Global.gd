extends Node

@onready var BaseTime = $/root/Node3D/BaseTime
var ObjectColliding := ""
var error_time = false
var can_move: bool = true
var first_scene = false
var titlescreen = true
var cutscene_started = false
var infoc = true
signal timeend
var power = false
var cutsceneskipped = false
var screenshake = false
var secondplay = false
var secondstart = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func calltime(time) -> void:
	BaseTime.set_wait_time(time)
	BaseTime.start()
	await BaseTime.timeout
	timeend.emit()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func skip_cutscene():
	cutsceneskipped = true
	print("works")
	$/root/Node3D/Player/Fade2.play("FadeIn")
	$/root/Node3D/Player/AnimationPlayer.play("fadeoutcuzcutsceneskipped")
	$/root/Node3D/Player/Fade2.play("FadeOut")
	$/root/Node3D/Player/Beginning.queue_free()
	$/root/Node3D/toilet.queue_free()
	$/root/Node3D/CAFETERIA.queue_free()
	$/root/Node3D/Principal.queue_free()
	$/root/Node3D/Classroom.queue_free()
	#$/root/Node3D/Player/Neck/Camera3D.make_current()
	$/root/Node3D/Player/Neck/ShakyCamera/Camera.make_current()
	$/root/Node3D/HospitalScene/Wind.play()
	can_move = true
