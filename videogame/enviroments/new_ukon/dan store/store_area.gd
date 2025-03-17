extends Area3D

var inarea = false

signal inStore(inarea)

func _on_body_entered(body):
	if body.name == "player":
		inarea = true
func _on_body_exited(body):
	if body.name == "player":
		inarea = false

func _process(_delta):
	inStore.emit(inarea)
