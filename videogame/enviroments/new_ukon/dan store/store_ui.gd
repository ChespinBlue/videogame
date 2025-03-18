extends CanvasLayer

var titlePosition = Vector2(274,11)
var titleStartPosition = Vector2(titlePosition.x,-400)

var Linarea

##### items
@onready var itemB1 = $inventory/itemB1
@onready var itemB2 = $inventory/itemB2
@onready var itemB3 = $inventory/itemB3
@onready var itemB4 = $inventory/itemB4

#### pieces
@onready var title = $title

func _process(_delta: float) -> void:
	if Linarea == true:
		title.position = lerp(title.position, titlePosition, 0.1)
	else:
		title.position = lerp(title.position, titleStartPosition, 0.1)
	if title.position == titleStartPosition:
		title.visible = false
	print(title.visible)

func _on_desk_area_in_store(inarea):
	if inarea == true:
		if Input.is_action_pressed("interact"):
			Linarea = true
	else:
		Linarea = false
