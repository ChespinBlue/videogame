extends Camera3D

var _position_last_frame := Vector3()

func _on_player_current_position(pos: Variant) -> void:
	var motion = pos - _position_last_frame
	_position_last_frame = pos
	position.z += motion.z
	
	if pos.x < 3:
		position.x += motion.x
