extends Control

var img_path = ["res://Scenes&Scripts/Particles/Star1/Star1.tscn",
				"res://Scenes&Scripts/Particles/Star2/Star2.tscn",
				"res://Scenes&Scripts/Particles/Star3/Star3.tscn",
				"res://Scenes&Scripts/Particles/Star4/Star4.tscn"]

func _ready():
	randomize()
	$MusicOn.hide()


func _on_Timer_timeout():
	var star1_instance = load(img_path[rand_range(0, 4)]).instance()
	$Collector.add_child(star1_instance)
	star1_instance.position = Vector2(rand_range(0, 1920), -50)


func _on_TextureButton_pressed():
	SceneSwitcher.switch("res://Levels/Level1/Level1.tscn", "1.. 2.. 3..")



func _on_MusicOff_pressed():
	$MusicOff.hide()
	$MusicOn.show()
	FoneMusic.stop()


func _on_MusicOn_pressed():
	$MusicOn.hide()
	$MusicOff.show()
	FoneMusic.play()
