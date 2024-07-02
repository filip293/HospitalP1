extends Node

func _notification(what):
	if what == NOTIFICATION_APPLICATION_FOCUS_IN:
		Global.infoc = true
	if what == NOTIFICATION_APPLICATION_FOCUS_OUT:
		Global.infoc = false
		
func _process(delta):
	if Global.infoc and Global.cutscene_started:
		get_tree().paused = false
	if !Global.infoc and Global.cutscene_started:
		get_tree().paused = true
