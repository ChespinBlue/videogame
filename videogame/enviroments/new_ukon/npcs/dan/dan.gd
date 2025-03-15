extends AnimatedSprite3D

var in_area = false
var words = "hi i'm daniel"
var namee = "Dan"
var istalking = false
signal speak

func _input(event):
	if event.is_action_pressed("interact"):
		if in_area == true:
			speak.emit(words, namee)

##### knows if in area
func _on_dan_area_body_entered(body):
	if body.name == "player":
		in_area = true

func _on_dan_area_body_exited(body):
	if body.name == "player":
		in_area = false


func _on_dialoguebox_dialboxstatus(dialboxopen):
	if dialboxopen == true:
		if istalking == false:
			animation = "talk"
			istalking = true
	else:
		animation = "idle"
		istalking = false

func _process(delta):
	print(animation)
