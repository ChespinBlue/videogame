extends Camera3D

### camera offset for top-down perspective
var offsety = 3.5
var offsetz = 5.5

#### follow player
func _on_player_current_position(pos):
	var goalpos = Vector3(pos.x, pos.y + offsety, pos.z + offsetz)
	## lerp smoothes movement
	position = lerp(position, goalpos, 0.2)
