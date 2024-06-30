extends Node3D

var postProcess = load("res://Scenes/PostProcess.tres")
# Called when the node enters the scene tree for the first time.
func _ready():
	Global.can_move = false
	postProcess.CRT = false
	$/root/Node3D/VHS.visible = false
	$/root/Node3D/Classroom/Camera3D.make_current()
	$/root/Node3D/Player/Fade.visible = false
	$/root/Node3D/SplashScreen/AnimationPlayer.play("Splash")
	await get_tree().create_timer(4).timeout
	$/root/Node3D/Player/Beginning.play()
	$/root/Node3D/Player/Fade2.play("FadeIn")
	await get_tree().create_timer(2).timeout
	$/root/Node3D/Story/Animation.play("FadeInOut")
	await get_tree().create_timer(5).timeout
	$/root/Node3D/Player/Fade2.play("FadeOut")
	$/root/Node3D/Principal.visible = false
	$/root/Node3D/Classroom/Talking.play()
	
	$/root/Node3D/Classroom/Teen3/AnimationPlayer.play("Idle")
	$/root/Node3D/Classroom/Teen4/AnimationPlayer.play("Idle")
	$/root/Node3D/Classroom/Teen5/AnimationPlayer.play("Talk")
	$/root/Node3D/Classroom/Teen6/AnimationPlayer.play("Talk")
	$/root/Node3D/Classroom/Teen7/AnimationPlayer.play("Hey")
	$/root/Node3D/Classroom/Teen8/AnimationPlayer.play("Laughing")
	await get_tree().create_timer(4).timeout
	DialogueManager.show_dialogue_balloon(load("res://Dialogue/Dialogue.dialogue"), "Classroom")
	$/root/Node3D/Classroom/Teen5/AnimationPlayer.play("Idle")
	$/root/Node3D/Classroom/Teen6/AnimationPlayer.play("Idle")
	$/root/Node3D/Classroom/Teen3/AnimationPlayer.play("Laugh")
	$/root/Node3D/Classroom/Teen7/AnimationPlayer.play("Talking")
	$/root/Node3D/Classroom/Teen8/AnimationPlayer.play("Talking")
	await get_tree().create_timer(3).timeout
	$/root/Node3D/Classroom/Teen8/AnimationPlayer.play("Idle")
	$/root/Node3D/Classroom/Teen7/AnimationPlayer.play("Idle")
	await get_tree().create_timer(3).timeout
	$/root/Node3D/Story/Label.text = "Every day is the same."
	$/root/Node3D/Player/Fade2.play("FadeIn")
	await get_tree().create_timer(2).timeout
	$/root/Node3D/Classroom/Talking.stop()
	$/root/Node3D/Story/Animation.play("FadeInOut")
	await get_tree().create_timer(5).timeout
	$/root/Node3D/Player/Fade2.play("FadeOut")
	$/root/Node3D/toilet/Camera3D.make_current()
	await get_tree().create_timer(3).timeout
	$/root/Node3D/toilet/Bang.play()
	await get_tree().create_timer(2).timeout
	DialogueManager.show_dialogue_balloon(load("res://Dialogue/Dialogue.dialogue"), "Toilet")
	$/root/Node3D/Principal.visible = true
	await get_tree().create_timer(6).timeout
	$/root/Node3D/Story/Label.text = "I can't take much more of this."
	$/root/Node3D/Player/Fade2.play("FadeIn")
	await get_tree().create_timer(2).timeout
	$/root/Node3D/Classroom/Talking.stop()
	$/root/Node3D/Story/Animation.play("FadeInOut")
	await get_tree().create_timer(5).timeout
	$/root/Node3D/Classroom.queue_free()
	$/root/Node3D/Player/Fade2.play("FadeOut")
	$/root/Node3D/Principal/Camera3D.make_current()
	$/root/Node3D/Principal/Principal2/AnimationPlayer.play("Sit")
	await get_tree().create_timer(5).timeout
	DialogueManager.show_dialogue_balloon(load("res://Dialogue/Dialogue.dialogue"), "Prin")
	await get_tree().create_timer(9).timeout
	$/root/Node3D/Principal/Ring.play()
	await get_tree().create_timer(3).timeout
	DialogueManager.show_dialogue_balloon(load("res://Dialogue/Dialogue.dialogue"), "PrinEx")
	$/root/Node3D/Story/Label.text = "Maybe things will get better."
	$/root/Node3D/Player/Fade2.play("FadeIn")
	await get_tree().create_timer(2).timeout
	$/root/Node3D/Principal/Ring.stop()
	$/root/Node3D/Story/Animation.play("FadeInOut")
	await get_tree().create_timer(5).timeout
	$/root/Node3D/Principal.queue_free()
	$/root/Node3D/Player/Fade2.play("FadeOut")
	$/root/Node3D/CAFETERIA/Camera3D.make_current()
	$/root/Node3D/CAFETERIA/Teen1/AnimationPlayer.play("Hey")
	$/root/Node3D/CAFETERIA/Teen6/AnimationPlayer.play("Idle")
	$/root/Node3D/CAFETERIA/Teen4/AnimationPlayer.play("Idle")
	DialogueManager.show_dialogue_balloon(load("res://Dialogue/Dialogue.dialogue"), "Caf")
	await get_tree().create_timer(1.4).timeout
	$/root/Node3D/CAFETERIA/Teen1/AnimationPlayer.play("Idle")
	await get_tree().create_timer(11.6).timeout
	$/root/Node3D/CAFETERIA/Laugh.play()
	$/root/Node3D/CAFETERIA/Teen1/AnimationPlayer.play("Laughing")
	await get_tree().create_timer(0.3).timeout
	$/root/Node3D/CAFETERIA/Teen6/AnimationPlayer.play("Laugh")
	await get_tree().create_timer(0.3).timeout
	$/root/Node3D/CAFETERIA/Teen4/AnimationPlayer.play("Laugh")
	await get_tree().create_timer(7).timeout
	$/root/Node3D/Story/Label.text = "I'll do it."
	$/root/Node3D/Player/Fade2.play("FadeIn")
	await get_tree().create_timer(4).timeout
	$/root/Node3D/Story/Animation.play("FadeInOut")
	await get_tree().create_timer(5).timeout
	$/root/Node3D/Player/Fade2.play("FadeOut")
	$/root/Node3D/Player/Neck/Camera3D.make_current()
	Global.can_move = true
	await get_tree().create_timer(5).timeout
	$/root/Node3D/toilet.queue_free()
	$/root/Node3D/CAFETERIA.queue_free()
	
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.first_scene == true:
		pass
		

func _on_animation_player_animation_finished(Splash):
	Global.first_scene = true
