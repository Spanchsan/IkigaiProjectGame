extends Node2D

var shake = false
var shake_amount = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	$Rocket/Light2D.hide()
	$Rocket/Timer.stop()
	$Rocket/Timer.connect("timeout", self, "shake")
	SceneSwitcher.connect("end", self, "start")

func start():
	$Rocket/Timer.start()
	shake = true
	$AudioStreamPlayer.play()

func _process(delta):
	shake_amount += delta if shake_amount + delta <= 5 and $Rocket.position.y > 500 else 0
	
	if shake:
		$Camera2D.set_offset(Vector2( \
		rand_range(-1.0, 1.0) * shake_amount, \
		rand_range(-1.0, 1.0) * shake_amount \
	))
	
	if $Rocket.position.y < 700:
		shake_amount -= delta * 1.5
	
	if shake_amount <= 0:
		shake = false
	
	if $Rocket.position.y < -1500:
		set_process(false)
		change_scene()

func _exit_tree():
	$AudioStreamPlayer.stop()

func change_scene():
	#changing to next level!
	SceneSwitcher.switch("res://Levels/Level2/Level2.tscn", "The first ten seconds")
