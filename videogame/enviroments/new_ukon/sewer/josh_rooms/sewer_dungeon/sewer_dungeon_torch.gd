extends Sprite2D

##### polygon1
@onready var timer = $Polygon2D/Timer
@onready var polygon = $Polygon2D.polygon
var center = Vector2(-4.5,-13.0)

@onready var new_pos = random_pos()
@onready var other_pos = new_pos

##### polygon2
@onready var polygon2 = $Polygon2D/Polygon2D2.polygon
var center2 = Vector2(-4.5,-20.25)

func _process(delta: float) -> void:
	
	##### polygon 1
	polygon[3] = lerp(polygon[3],new_pos,4*delta)
	polygon[4].x = lerp(polygon[4].x,(other_pos.x-12)/2,3*delta)
	polygon[2].x = lerp(polygon[2].x,(other_pos.x+2)/2,3*delta)
	$Polygon2D.polygon = polygon
	
	#### polygon 2
	polygon2[2].x = lerp(polygon2[2].x,(new_pos.x+center2.x)/2,3*delta)
	$Polygon2D/Polygon2D2.polygon = polygon2

func random_pos():
	var posX = randi_range(-15,10)
	
	var posY = (center.y - sqrt(abs(200 - (posX - center.x)**2)))
	
	# y₂ = y₁ ±√(d² - (x₂ - x₁)² )
	# d = √((x₂ - x₁)² + (y₂ - y₁)²)
	
	return Vector2(posX,posY)
	#polygon[2] = Vector2(posX, posY)
	#$Polygon2D.polygon = polygon

func _input(event):
	##### exit & restart (remove eventually)
	if event.is_action_pressed("exit"):
		get_tree().quit()
	if event.is_action_pressed("restart"):
		get_tree().reload_current_scene()


func _on_timer_timeout() -> void:
	other_pos = new_pos
	new_pos = random_pos()
	#timer.wait_time = randf_range(0.1,1.0)
