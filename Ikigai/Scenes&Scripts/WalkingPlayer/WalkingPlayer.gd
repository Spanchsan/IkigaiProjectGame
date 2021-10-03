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
	if velocity != Vector2.ZERO:
		$AnimationAtEarth.play("default")
	else:
		$AnimationAtEarth.play("idle")
	if x < 0:
		$AnimationAtEarth.flip_h = false
	elif x > 0:
		$AnimationAtEarth.flip_h = true

func _on_Area2D_area_exited(area):
	area_exited = true


func _on_Area2D_area_entered(area):
	area_exited = false
	yield(get_tree().create_timer(2), "timeout")
	if not area_exited:
		emit_signal("pick", area.name)
