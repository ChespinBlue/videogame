extends CanvasLayer

var inventory = ["dan flake","dan flake II","dan flake+", "pistol", "rifle"]
var description = ["an ordinary dan flake", "new and imporved", "starting at $10.99 a month","gun","gun"]
var prices = [2,2,10,30,40]

var titlePos = Vector2(248,24)
var titleStartPos = Vector2(titlePos.x,-400)
var inventoryPanelPos = Vector2(16,80)
var inventoryPanelStartPos = Vector2(inventoryPanelPos.x,-800)

var Linarea = false

signal openInv(bool)
signal addInv(item, cost)

signal interacted(nam,text)

#### pieces
@onready var list = $inventory/list
@onready var title = $title
@onready var inventoryPanel = $inventory

var PrevLinarea = false
func _process(delta: float) -> void:
	update_inventory()
	if PrevLinarea != Linarea:
		openInv.emit(Linarea)
		
	if Linarea == true:
		visible = true
		title.position = lerp(title.position, titlePos, 5.0*delta)
		inventoryPanel.position = lerp(inventoryPanel.position, inventoryPanelPos, 6.0*delta)
	else:
		#visible = false
		title.position = lerp(title.position, titleStartPos, 5.0*delta)
		inventoryPanel.position = lerp(inventoryPanel.position, inventoryPanelStartPos, 5.0*delta)
		
	PrevLinarea = Linarea

func update_inventory():
	for i in list.get_children().size():
		if i < inventory.size():
			var item_label = list.get_child(i)
			item_label.text = str(" ", inventory[i], " $", prices[i])
		else:
			### update empty slots to be blank
			if list.get_child(i) is Button:
				list.get_child(i).text = ""

func _on_desk_area_in_store(inarea):
	if inarea == true:
		if Input.is_action_pressed("interact"):
			Linarea = true
	else:
		Linarea = false


#### buttons sends data to inventory when pressed
func _on_item_b_1_pressed() -> void:
	addInv.emit(inventory[0],prices[0])
func _on_item_b_2_pressed() -> void:
	addInv.emit(inventory[1],prices[1])
func _on_item_b_3_pressed() -> void:
	addInv.emit(inventory[2],prices[2])
func _on_item_b_4_pressed() -> void:
	addInv.emit(inventory[3],prices[3])
func _on_item_b_5_pressed() -> void:
	addInv.emit(inventory[4],prices[4])
func _on_item_b_6_pressed() -> void:
	addInv.emit(inventory[5],prices[5])


func _on_item_b_1_mouse_entered():
	pass
	#interacted.emit(inventory[0],description[0])
func _on_item_b_2_mouse_entered():
	pass
	#interacted.emit(inventory[1],description[1])
func _on_item_b_3_mouse_entered():
	pass
	#interacted.emit(inventory[2],description[2])
func _on_item_b_4_mouse_entered():
	pass
	#interacted.emit(inventory[3],description[3])
func _on_item_b_5_mouse_entered():
	pass
	#interacted.emit(inventory[4],description[4])
func _on_item_b_6_mouse_entered():
	pass
	#interacted.emit(inventory[5],description[5])
