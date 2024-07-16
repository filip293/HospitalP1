extends Node3D
var postProcess = load("res://Scenes/PostProcess.tres")

var first = true
# Called when the node enters the scene tree for the first time.
func _ready():
	$/root/Node3D/TitleScreen/Path3D/PathFollow3D/Node3D/RayCast3D.enabled = false
	Global.can_move = false
	postProcess.CRT = false
	$/root/Node3D/VHS.visible = false
	$/root/Node3D/Player/Fade.visible = false
	$/root/Node3D/SplashScreen/AnimationPlayer.play("Splash")
	await Global.calltime(6)
	$/root/Node3D/Player/Fade2.play("FadeIn")
	await Global.calltime(4)
	$/root/Node3D/TitleScreen/Path3D/PathFollow3D/Node3D/Camera3D.make_current()
	$/root/Node3D/Player/Fade2.play("FadeOut")
	Input.set_mouse_mode(Input.MOUSE_MODE_CONFINED)
	$/root/Node3D/TitleScreen/Path3D/PathFollow3D/Node3D/RayCast3D.enabled = true
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.first_scene == true and first == true:
		var mc2 = $"../Principal/MC/AnimationPlayer"
		var mc3 = $"../toilet/MC/AnimationPlayer"
		var mc4 = $MC/AnimationPlayer
		mc2.play("Sitting")
		mc3.play("Sitting")
		mc4.play("Sitting")
		first = false
		Global.cutscene_started = true
		$/root/Node3D/Player/Beginning.play()
		$/root/Node3D/Player/Fade2.play("FadeIn")
		await Global.calltime(2)
		$/root/Node3D/Classroom/Camera3D.make_current()
		$/root/Node3D/Story/Animation.play("FadeInOut")
		await Global.calltime(5)
		$/root/Node3D/Player/Fade2.play("FadeOut")
		$/root/Node3D/Principal.visible = false
		$/root/Node3D/Classroom/Talking.play()
		$/root/Node3D/Classroom/Teen3/AnimationPlayer.play("Idle")
		$/root/Node3D/Classroom/Teen4/AnimationPlayer.play("Idle")
		$/root/Node3D/Classroom/Teen5/AnimationPlayer.play("Talk")
		$/root/Node3D/Classroom/Teen6/AnimationPlayer.play("Talk")
		$/root/Node3D/Classroom/Teen7/AnimationPlayer.play("Hey")
		$/root/Node3D/Classroom/Teen8/AnimationPlayer.play("Laughing")
		await Global.calltime(4)
		DialogueManager.show_dialogue_balloon(load("res://Dialogue/Dialogue.dialogue"), "Classroom")
		$/root/Node3D/Classroom/Teen5/AnimationPlayer.play("Idle")
		$/root/Node3D/Classroom/Teen6/AnimationPlayer.play("Idle")
		$/root/Node3D/Classroom/Teen3/AnimationPlayer.play("Laugh")
		$/root/Node3D/Classroom/Teen7/AnimationPlayer.play("Talking")
		$/root/Node3D/Classroom/Teen8/AnimationPlayer.play("Talking")
		await Global.calltime(3)
		$/root/Node3D/Classroom/Teen8/AnimationPlayer.play("Idle")
		$/root/Node3D/Classroom/Teen7/AnimationPlayer.play("Idle")
		await Global.calltime(3)
		$/root/Node3D/Story/Label.text = "Every day is the same."
		$/root/Node3D/Player/Fade2.play("FadeIn")
		await Global.calltime(2)
		$/root/Node3D/Classroom/Talking.stop()
		$/root/Node3D/Story/Animation.play("FadeInOut")
		await Global.calltime(5)
		$/root/Node3D/Player/Fade2.play("FadeOut")
		$/root/Node3D/toilet/Camera3D.make_current()
		await Global.calltime(3)
		$/root/Node3D/toilet/Bang.play()
		await Global.calltime(2)
		DialogueManager.show_dialogue_balloon(load("res://Dialogue/Dialogue.dialogue"), "Toilet")
		$/root/Node3D/Principal.visible = true
		await Global.calltime(6)
		$/root/Node3D/Story/Label.text = "I can't take much more of this."
		$/root/Node3D/Player/Fade2.play("FadeIn")
		await Global.calltime(2)
		$/root/Node3D/Classroom/Talking.stop()
		$/root/Node3D/Story/Animation.play("FadeInOut")
		await Global.calltime(5)
		$/root/Node3D/Classroom.queue_free()
		$/root/Node3D/Player/Fade2.play("FadeOut")
		$/root/Node3D/Principal/Camera3D.make_current()
		$/root/Node3D/Principal/Principal2/AnimationPlayer.play("Sit")
		await Global.calltime(5)
		DialogueManager.show_dialogue_balloon(load("res://Dialogue/Dialogue.dialogue"), "Prin")
		await Global.calltime(9)
		$/root/Node3D/Principal/Ring.play()
		await Global.calltime(3)
		DialogueManager.show_dialogue_balloon(load("res://Dialogue/Dialogue.dialogue"), "PrinEx")
		$/root/Node3D/Story/Label.text = "Maybe things will get better."
		$/root/Node3D/Player/Fade2.play("FadeIn")
		await Global.calltime(2)
		$/root/Node3D/Principal/Ring.stop()
		$/root/Node3D/Story/Animation.play("FadeInOut")
		await Global.calltime(5)
		$/root/Node3D/Principal.queue_free()
		$/root/Node3D/Player/Fade2.play("FadeOut")
		$/root/Node3D/CAFETERIA/Camera3D.make_current()
		$/root/Node3D/CAFETERIA/Teen1/AnimationPlayer.play("Hey")
		$/root/Node3D/CAFETERIA/Teen6/AnimationPlayer.play("Idle")
		$/root/Node3D/CAFETERIA/Teen4/AnimationPlayer.play("Idle")
		DialogueManager.show_dialogue_balloon(load("res://Dialogue/Dialogue.dialogue"), "Caf")
		await Global.calltime(1.4)
		$/root/Node3D/CAFETERIA/Teen1/AnimationPlayer.play("Idle")
		await Global.calltime(11.6)
		$/root/Node3D/CAFETERIA/Laugh.play()
		$/root/Node3D/CAFETERIA/Teen1/AnimationPlayer.play("Laughing")
		await Global.calltime(0.3)
		$/root/Node3D/CAFETERIA/Teen6/AnimationPlayer.play("Laugh")
		await Global.calltime(0.3)
		$/root/Node3D/CAFETERIA/Teen4/AnimationPlayer.play("Laugh")
		await Global.calltime(7)
		$/root/Node3D/Story/Label.text = "I'll do it."
		$/root/Node3D/Player/Fade2.play("FadeIn")
		await Global.calltime(4)
		$/root/Node3D/Story/Animation.play("FadeInOut")
		await Global.calltime(5)
		$/root/Node3D/Player/Fade2.play("FadeOut")
		$/root/Node3D/Player/Neck/Camera3D.make_current()
		$/root/Node3D/HospitalScene/Wind.play()
		Global.can_move = true
		await Global.calltime(5)
		$/root/Node3D/toilet.queue_free()
		$/root/Node3D/CAFETERIA.queue_free()
		

