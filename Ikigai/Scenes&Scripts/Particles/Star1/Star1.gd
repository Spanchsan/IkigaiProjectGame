extends Particles2D

var time = 0
var stop = false
var fall_speed = rand_range(100, 500)

func _process(delta):
	global_position = Vector2(global_position.x, global_position.y + fall_speed * delta)
	if global_position.y >= 2000:
		queue_free()
