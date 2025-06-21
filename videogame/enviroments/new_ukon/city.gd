extends StaticBody3D

##### store UI
signal store_openInv(bool)
signal store_addInv(item, cost)
func _on_store_ui_add_inv(item: Variant, cost: Variant) -> void:
	store_addInv.emit(item, cost)
func _on_store_ui_open_inv(Linarea) -> void:
	store_openInv.emit(Linarea)

#### manhole
signal manhole_interacted(nam,text,op1,op2)
func _on_manhole_area_interacted(nam: Variant, text: Variant, option1: Variant, option2: Variant) -> void:
	manhole_interacted.emit(nam,text,option1,option2)

### dialoguebox multiple option response
signal dialogue_option(nam,option)
func _on_dialoguebox_dialogue_option(nam: Variant, option: Variant) -> void:
	dialogue_option.emit(nam,option)
