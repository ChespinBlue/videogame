extends CanvasLayer

@onready var list = $list

@onready var cashLabel = $cash
var cash = 100

var inventory = ["bread","fork"]

func _process(_delta: float) -> void:
	update_inventory()
	cashLabel.text = str("$", cash)

func _input(event):
	##### show when inventory button pressed
	if event.is_action_pressed("inventory"):
		if visible == false:
			visible = true
		else:
			visible = false

func update_inventory():
	##### google ai wrote some this
	for i in list.get_children().size():
		if i < inventory.size():
			var item_label = list.get_child(i)
			item_label.text = inventory[i]
		else:
			### update empty slots to be blank
			if list.get_child(i) is Label:
				list.get_child(i).text = ""


func _on_store_ui_open_inv(open: Variant) -> void:
	if open == true:
		visible = true
	else:
		visible = false


func _on_store_ui_add_inv(item: Variant, cost: Variant) -> void:
	var numberInInv = 0
	for i in inventory:
		numberInInv += 1
	if numberInInv < 8 and cash >= cost:
		inventory.append(item)
		cash -= cost
