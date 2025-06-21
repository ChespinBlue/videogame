extends Area3D
var inarea = false

var nam = "#:#manhole"
var text = "Would you like to enter the sewer?"
signal interacted(nam, text, option1, option2)

func _on_body_entered(body: Node3D) -> void:
	if body.name == "player":
		inarea = true

func _on_body_exited(body: Node3D) -> void:
	if body.name == "player":
		inarea = false

func _input(event):
	if event.is_action_pressed("interact"):
		if inarea == true:
			interacted.emit(nam,text,"yes","no")


func _on_city_dialogue_option(nam: Variant, option: Variant) -> void:
	if nam == "#:#manhole":
		if option == "yes":
			get_tree().change_scene_to_file("res://enviroments/new_ukon/sewer/sewer.tscn")
		if option == "no":
			interacted.emit(nam,"@:@","","")
