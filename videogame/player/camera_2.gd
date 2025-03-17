extends Camera3D

func _on_store_area_in_store(inarea) -> void:
	if inarea == true:
		current = true
	else:
		current = false
