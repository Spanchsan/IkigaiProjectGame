extends Button

var flag = false
var fall = 10
var gravity = Vector2(0, 300)
func _ready():
	pass # Replace with function body.

func _process(delta):
	if(flag):
		get_parent().position = get_global_mouse_position()
	
	if(get_parent().position.y < 800 && !flag):
		get_parent().position += gravity * delta

func _pressed():
	flag = !flag;
