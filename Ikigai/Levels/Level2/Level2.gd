extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	SceneSwitcher.connect("end", self, "start")
	$PlayerAtEarth.connect("pick", self, "pick")
	

func start():
	HintLabel._make_text('During the flight, the speed will be too high! Choose the right seat, otherwise the astronaut will lose his consciousness!')

func pick(name):
	if name != 'Chair2':
		SceneSwitcher.switch_to_lose_scene("Oh no, the astronaut lost his consciousness! Try it again!")
	else:
		SceneSwitcher.switch_to_next_lvl_scene("Congratulations! Due to the high speed, the blood transfused to the legs, and in order to remain conscious, it is necessary to ensure blood circulation to the brain. This seat will help direct the blood from the legs to the chest and further to the head." , "res://Levels/Level3/Level3.tscn")
