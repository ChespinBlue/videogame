extends CanvasLayer

@onready var label = $Panel/Label
@onready var scrollbar = $Panel/scrollbar

var charCount

var dialboxopen : bool
signal dialboxstatus(dialboxopen)

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
func showtext(x):
	charCount = 0
	visible = true
	label.text = x
	
	### if dialogue exceeds what the box can show then the scroll bar will appear
	## scroll bar has not been coded to scroll yet 
	for i in range(0, len(x)):  
		if(x[i] != ' '):  
			charCount = charCount + 1;
	if charCount > 368:
		print("long text")
		scrollbar.visible = true

#### recieves signals and displays singaled text
func _on_spamton_interacted(text):
	showtext(text)
func _on_npc_interacted(text):
	showtext(text)
