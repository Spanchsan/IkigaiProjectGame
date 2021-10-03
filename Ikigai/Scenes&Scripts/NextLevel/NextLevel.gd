extends Node2D

var next_scene = ''

func _ready():
	$TextureButton.set_disabled(true)
	SceneSwitcher.connect("end", self, "ready")
	SceneSwitcher.connect("win_text", self, "set_text")
	SceneSwitcher.connect("change_to_next_scene", self, "change_scene")

func ready():
	$TextureButton.set_disabled(false)

func set_text(text):
	$Label.text = text

func change_scene(scene):
	next_scene = scene 

func _on_TextureButton_pressed():
	SceneSwitcher.switch(next_scene)
