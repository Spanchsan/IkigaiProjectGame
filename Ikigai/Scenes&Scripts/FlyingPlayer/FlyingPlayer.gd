extends KinematicBody2D

var SPEED = 300
var velocity = Vector2.ZERO
var area_exited = false
signal pick

func _physics_process(delta):
	input()
	move_and_slide(velocity * SPEED)

func input():
	var x = 0
	var y = 0
	if Input.is_action_pressed("Left"): x = -1
	if Input.is_action_pressed("Right"): x = 1
	if Input.is_action_pressed("Down"): y = 1
	if Input.is_action_pressed("Up"): y = -1
	velocity = Vector2(x, y).normalized()
	if x > 0:
		$AnimatedSprite.play("FlyingRight")
	elif x < 0:
		$AnimatedSprite.play("FlyingLeft")
	else:
		if y < 0:
			$AnimatedSprite.play("Behind")
		elif y > 0:
			$AnimatedSprite.play("Front")


func _on_Area2D_area_entered(area):
	area_exited = false
	yield(get_tree().create_timer(2), "timeout")
	if not area_exited:
		emit_signal("pick", area.name)


func _on_Area2D_area_exited(area):
	area_exited = true
