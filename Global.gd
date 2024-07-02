extends Node

@onready var BaseTime = $/root/Node3D/BaseTime
var ObjectColliding := ""
var error_time = false
var can_move: bool = true
var first_scene = true
var titlescreen = false
var cutscene_started = false
var infoc = true
signal timeend
var power = false
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
