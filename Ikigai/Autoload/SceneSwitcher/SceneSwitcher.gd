extends Node

onready var anim = $AnimationPlayer
onready var rect = $OverlayLayer/ColorRect
onready var text = $OverlayLayer/TitleOfScene
signal end
signal lose_text
signal win_text
signal change_to_next_scene

func _ready():
	rect.hide()
	text.hide()

func switch(scene: String, title: String=""):
	rect.show()
	anim.play("fade_in")
	yield(anim, "animation_finished")
	
	get_tree().change_scene(scene)
	
	print(title)
	text.text = title
	text.show()
	yield(get_tree().create_timer(len(title.split(' ')) / 3), "timeout")
	
	anim.play("fade_out")
	
	yield(anim, "animation_finished")
	
	emit_signal("end")
	text.text = ''
	rect.hide()

func switch_to_lose_scene(fail_text):
	rect.show()
	anim.play("fade_in")
	yield(anim, "animation_finished")
	
	get_tree().change_scene("res://Scenes&Scripts/Restart/FailScene.tscn")
	yield(get_tree(), "idle_frame")
	
	emit_signal("end")
	emit_signal("lose_text", fail_text)
	
	anim.play("fade_out")
	yield(anim, "animation_finished")
	text.text = ''
	
	rect.hide()

func switch_to_next_lvl_scene(_text, next_scene):
	rect.show()
	anim.play("fade_in")
	yield(anim, "animation_finished")
	
	get_tree().change_scene("res://Scenes&Scripts/NextLevel/NextLevel.tscn")
	yield(get_tree(), "idle_frame")
	
	emit_signal("end")
	emit_signal("win_text", _text)
	emit_signal("change_to_next_scene", next_scene)
	
	anim.play("fade_out")
	yield(anim, "animation_finished")
	text.text = ''
	
	rect.hide()
	
