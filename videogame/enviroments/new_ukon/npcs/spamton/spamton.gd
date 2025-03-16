extends Sprite3D

#### if player is in range to speak to npc, "in area" = true
var inarea = false

var dialogueBranch = 0
var text1 = "Hi, my name's Spamton! I like to sell things. Kromer!"
var text2 = "Would you like to buy Hyperlink Blocked?"
var text3 = "Amazing! Now your a big shot!"
var text4 = "No? But now's your chance to be a big shot!"
var text5 = "Thanks! Have a nice day!"
var text6 = "That's alright. Have a nice day!"

signal interacted(nam, text, option1, option2)

func _input(event):
	if event.is_action_pressed("interact"):
		if inarea == true:
			if dialogueBranch == 3:
				dialogueBranch += 2
				interacted.emit(name, text6)
			if dialogueBranch == 2:
				dialogueBranch += 2
				interacted.emit(name, text5)
			if dialogueBranch == 1:
				interacted.emit(name, text2, "yes", "no")
			if dialogueBranch == 0:
				dialogueBranch += 1
				interacted.emit(name, text1)
			


## updates if player in range to speak to npc
func _on_spamton_area_body_entered(body):
	if body.name == "player":
		inarea = true
		dialogueBranch = 0
func _on_spamton_area_body_exited(body):
	if body.name == "player":
		inarea = false


func _on_dialoguebox_dialogue_option(nam, option):
	if nam == name:
		if option == "yes":
			dialogueBranch = 2
			interacted.emit(name, text3)
		if option == "no":
			dialogueBranch = 3
			interacted.emit(name, text4)
