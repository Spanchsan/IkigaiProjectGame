extends Node2D


func _ready():
	SceneSwitcher.connect("end", self, 'start')
	$Player.connect("pick", self, "pick")
	start()

func start():
	HintLabel._make_text('Every time we get up, gravity pulls blood into the parts of the body that are below the heart. There is no gravity in space, respectively, blood flows only to the chest and head. This can lead to fainting. Prevent fainting! (Pick one of 3 items)')

func pick(name):
	if name != 'Item1':
		SceneSwitcher.switch_to_lose_scene("Oh no, try it again!")
	else:
		SceneSwitcher.switch_to_next_lvl_scene("That's right, keep it up! Exercise in space is an effective way to support most types of cardiovascular system. In addition, astronauts can wear special trousers that use the pressure drop to draw blood back into the stomach and legs.", "res://Scenes&Scripts/MainMenu/Menu.tscn")
