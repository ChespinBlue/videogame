extends CanvasLayer

@onready var body = $Panel/body
@onready var nameL = $Panel/name
@onready var scrollbar = $Panel/scrollbar
@onready var option1b = $Panel/HBoxContainer/option1
@onready var option2b = $Panel/HBoxContainer/option2
@onready var option3b = $Panel/HBoxContainer/option3
@onready var option4b = $Panel/HBoxContainer/option4

var charCount

### know who is currently controlling dialogue box
var currentSpeaker = "none"

var dialboxopen : bool
signal dialboxstatus(dialboxopen)

signal dialogueOption(nam, option)

### tells player script (or any other script) whether or not the dialogue box is on screen
func _process(_delta):
	if visible == true:
		dialboxopen = true
	else:
		dialboxopen = false
	dialboxstatus.emit(dialboxopen)

### close button
func _on_close_pressed():
	scrollbar.visible = false
	visible = false

########################################### text
#### first var is text, the rest are input options
func showtext(nam, a, b = null, c = null, d = null, e = null):
	currentSpeaker = nam
	charCount = 0
	visible = true
	body.text = a
	nameL.text = nam
	### if dialogue exceeds what the box can show then the scroll bar will appear
	## scroll bar has not been coded to scroll yet 
	for i in range(0, len(a)):  
		if(a[i] != ' '):  
			charCount = charCount + 1;
	if charCount > 368:
		scrollbar.visible = true
	
	## option buttons
	if b:
		option1b.visible = true
		option1b.text = b 
	else:
		option1b.visible = false
	if c:
		option2b.visible = true
		option2b.text = c
	else:
		option2b.visible = false
	if d:
		option3b.visible = true
		option3b.text = d
	else:
		option3b.visible = false
	if e:
		option4b.visible = true
		option4b.text = e
	else:
		option4b.visible = false

#### recieves signals and displays signaled text
func _on_spamton_interacted(nam, text, b = null, c = null, d = null, e = null):
	showtext(nam, text, b, c, d, e)
func _on_npc_interacted(nam, text):
	showtext(nam, text)
func _on_store_ui_interacted(nam, text):
	showtext(nam, text)

#### when pressed, emits signal that-- nvm its pretty self expanitory
func _on_option_1_pressed():
	dialogueOption.emit(currentSpeaker, option1b.text)
func _on_option_2_pressed():
	dialogueOption.emit(currentSpeaker, option2b.text)
func _on_option_3_pressed():
	dialogueOption.emit(currentSpeaker, option3b.text)
func _on_option_4_pressed():
	dialogueOption.emit(currentSpeaker, option4b.text)
