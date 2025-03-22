extends VehicleBody3D

signal InCarS(InCar, pos)
var InCar = false
var InArea = false

var SPEED = 50

func _physics_process(delta: float) -> void:
	steering = Input.get_axis("right","left") * 0.4
	engine_force = Input.get_axis("down","up") * SPEED
	
	if InCar == true:
		SPEED = 50
	else:
		SPEED = 0
	### tell player script if in car
	InCarS.emit(InCar, position)
		


func _input(event):
	if event.is_action_pressed("interact"):
		if InCar == true:
			InCar = false
			return
		if InArea == true:
			InCar = true

func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.name == "player":
		InArea = true
func _on_area_3d_body_exited(body: Node3D) -> void:
	if body.name == "player":
		InArea = false
