extends Node2D

func _ready():
	$TextureButton.set_disabled(true)
	SceneSwitcher.connect("end", self, "ready")
	SceneSwitcher.connect("lose_text", self, "set_text")

func ready():
	$TextureButton.set_disabled(false)

func set_text(text):
	$Label.text = text

func _on_TextureButton_pressed():
	SceneSwitcher.switch("res://Scenes&Scripts/MainMenu/Menu.tscn")

