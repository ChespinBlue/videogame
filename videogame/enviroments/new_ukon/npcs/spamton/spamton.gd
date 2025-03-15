extends Sprite3D

#### if player is in range to speak to npc, "in area" = true
var inarea = false

var dialogueBranch = 0

signal interacted(text)

func _input(event):
	if event.is_action_pressed("interact"):
		if inarea == true:
			if dialogueBranch == 3:
				interacted.emit("That's alright. Have a nice day!")
				dialogueBranch += 1
			if dialogueBranch == 2:
				interacted.emit("No? But now's your chance to be a big shot! >>")
				dialogueBranch += 1
			if dialogueBranch == 1:
				interacted.emit("Would you like to buy Hyperlink Blocked? >>")
				dialogueBranch += 1
			if dialogueBranch == 0:
				interacted.emit("Hi, my name's Spamton! I like to sell things. Kromer!")
				dialogueBranch += 1
			


## updates if player in range to speak to npc
func _on_spamton_area_body_entered(body):
	if body.name == "player":
		inarea = true
		dialogueBranch = 0
func _on_spamton_area_body_exited(body):
	if body.name == "player":
		inarea = false
