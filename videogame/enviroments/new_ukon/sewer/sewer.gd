extends StaticBody3D

signal interacted()

func _process(delta: float) -> void:
	if prev_ladinarea:
		if not ladinarea:
			interacted.emit(ladder_nam,"@:@")
	prev_ladinarea = ladinarea
	
	if prev_joshdoorinarea:
		if not joshdoorinarea:
			interacted.emit(joshdoor_nam,"@:@")
			joshdoor_branch = 1
	prev_joshdoorinarea = joshdoorinarea

func _input(event):
	if event.is_action_pressed("interact"):
		if ladinarea == true:
			interacted.emit(ladder_nam,ladder_text,"yes","no")
		
		if joshdoorinarea == true:
			if not have_josh_key:
				if joshdoor_branch == 1:
					interacted.emit(joshdoor_nam,joshdoor_text1)
					joshdoor_branch = -1
					return
				if joshdoor_branch == -1:
					interacted.emit(joshdoor_nam,"@:@")
					joshdoor_branch = 1
			if have_josh_key:
				joshdoor_branch += 1
				if joshdoor_branch == 2:
					interacted.emit(joshdoor_nam,joshdoor_text2)
					return
				if joshdoor_branch == 3:
					interacted.emit(joshdoor_nam,joshdoor_text3)
					return
				if joshdoor_branch == 4:
					interacted.emit(joshdoor_nam,joshdoor_text4,"yes","no")
			joshdoor_branch = 1
		
		if josh_key_inarea:
			if josh_key_b == 1:
				interacted.emit("#:#joshkey","@:@")
				josh_key_b = 2

func _on_dialoguebox_dialogue_option(nam: Variant, option: Variant) -> void:
	if nam == "#:#sewerladder1":
		if option == "yes":
			visible = false
			get_tree().change_scene_to_file("res://scenes/main.tscn")
		if option == "no":
			interacted.emit(nam,"@:@")
	if nam == "#:#joshdoor":
		if option == "yes":
			get_tree().change_scene_to_file("res://enviroments/new_ukon/sewer/josh_rooms/josh_rooms.tscn")
		if option == "no":
			interacted.emit(nam,"@:@")

############################ AREAS
### exit ladder
var ladder_nam = "#:#sewerladder1"
var ladder_text = "Would you like to emerge from the sewer?"

var ladinarea : bool
var prev_ladinarea : bool
func _on_ladder_area_body_entered(body: Node3D) -> void:
	if body.name == "player":
		ladinarea = true
func _on_ladder_area_body_exited(body: Node3D) -> void:
	if body.name == "player":
		ladinarea = false
		
### josh door
var have_josh_key = false
var joshdoor_branch = 1
var joshdoor_nam = "#:#joshdoor"
var joshdoor_text1 = "You don't have a key for this door."
var joshdoor_text2 = "The key doesn't fit."
var joshdoor_text3 = "The door was already unlocked anyways."
var joshdoor_text4 = "Enter?"

var joshdoorinarea : bool
var prev_joshdoorinarea : bool
func _on_josh_door_area_body_entered(body: Node3D) -> void:
	if body.name == "player":
		joshdoorinarea = true
func _on_josh_door_area_body_exited(body: Node3D) -> void:
	if body.name == "player":
		joshdoorinarea = false
		joshdoor_branch = 1

### josh KEY
var josh_key_b = 1
var josh_key_inarea
func _on_josh_key_area_body_entered(body: Node3D) -> void:
	if body.name == "player":
		josh_key_inarea = true
		have_josh_key = true
		$josh_key.visible = false
		interacted.emit("#:#joshkey","You found a key.")
func _on_josh_key_area_body_exited(body: Node3D) -> void:
	if body.name == "player":
		josh_key_inarea = false
		interacted.emit("#:#joshkey","@:@")
		josh_key_b = 2
