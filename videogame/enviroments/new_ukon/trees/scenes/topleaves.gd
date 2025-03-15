extends Node2D

var random = RandomNumberGenerator.new()

@onready var trunk = $trunk

@onready var end = trunk.end
@onready var leafn = trunk.leafn
@onready var treetype = trunk.treetype
var number = 1
var cenX = 1

func leafout(a, b, c):
	for i in range(b - 1):
		cenX = random.randi_range(-40, 40)
		var cenY = random.randi_range(-40, 40)
		var cen = Vector2(cenX,cenY) + a
		var rad = random.randi_range(1, 4)
		var color = Color(0.2,0.9,0.2)
		if c == 4:
			color = Color(0.9,0.8,0.4)
		else:
			color = Color(0.2,0.9,0.2)
		draw_circle(cen,rad,color)
		print("leafing")


func _process(delta):
	end = trunk.end
	leafn = trunk.leafn
	treetype = trunk.treetype

func _input(event):
	if event.is_action_pressed("test"):
		print("t")


func _draw():
	leafout(end, leafn, treetype)
	print("dr")

func _ready():
	leafout(end, leafn, treetype)
