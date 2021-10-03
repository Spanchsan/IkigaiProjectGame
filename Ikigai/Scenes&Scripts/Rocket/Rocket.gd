extends Sprite

var fly = false
var SPEED = 10
var temp = false
var shake = 0

func _ready():
	$FireParticles.emitting = false

func _physics_process(delta):
	if fly:
		self.position.y -= SPEED * delta
		SPEED += SPEED * delta
	if shake:
		if temp:
			self.position.x += shake
			temp = false
		else:
			self.position.x -= shake
			temp = true
		shake += delta if shake + delta <= 5 else 0
	

func _on_Timer_timeout():
	shake = 0.1
	yield(get_tree().create_timer(1), "timeout")
	$FireParticles.emitting = true
	fly = true
	$Light2D.show()
