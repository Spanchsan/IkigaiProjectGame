extends Sprite

func _make_text(text: String):
	show()
	$AnimationPlayer.play("In")
	$Label.text = text
	yield($AnimationPlayer, "animation_finished")
	yield(get_tree().create_timer(len(text.split(' ')) / 3), "timeout")
	$AnimationPlayer.play("Out")
	yield($AnimationPlayer, "animation_finished")
	hide()
