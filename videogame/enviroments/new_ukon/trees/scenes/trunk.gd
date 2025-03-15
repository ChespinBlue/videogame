extends Line2D

var random = RandomNumberGenerator.new()
signal treetop

var height = 0
var moved = 0



func _ready():
	generateTree()

func generateTree():
	width = random.randi_range(4, 7)
	
	var seg1y = random.randi_range(-5*width, -2*width)
	var seg2y = random.randi_range(-40, -20) + seg1y
	var seg1x = random.randi_range(-5, 5)
	var seg2x = random.randi_range(-1, 1)
	height = seg2y
	moved = seg2y
	
	set_point_position(1, Vector2(get_point_position(0).x + seg1x, get_point_position(0).y + seg1y))
	set_point_position(2, Vector2(get_point_position(0).x + seg2x, get_point_position(0).y + seg2y))




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

######### exit
func _input(event):
	if event.is_action_pressed("exit"):
		get_tree().quit()
	if event.is_action_pressed("test"):
		generateTree()

func _draw():
	var cen = Vector2(0,height)
	#var rad = 42
	var rad = random.randi_range(0.3*abs(height), 0.5*abs(height))
	#var col = Color(0.1,0.8,0.1)
	#####other circles
	##2
	var rad2 = rad - random.randi_range(1, 8)
	var cen2dispx = random.randi_range(-10, 10)
	var cen2dispy = random.randi_range(-10, 10)
	var cen2 = Vector2(cen2dispx,height + cen2dispy)
	##3
	var rad3 = rad - random.randi_range(1, 5)
	var cen3dispx = random.randi_range(-10, 10)
	var cen3dispy = random.randi_range(-10, 10)
	var cen3 = Vector2(cen3dispx,height + cen3dispy)
	##4
	var rad4 = rad - random.randi_range(1, 5)
	var cen4dispx = random.randi_range(-10, 10)
	var cen4dispy = random.randi_range(-10, 10)
	var cen4 = Vector2(cen4dispx,height + cen4dispy)
	####5
	var rad5 = rad - random.randi_range(20, 30)
	var cen5dispx = 1
	var cen5dispxside = random.randi_range(0, 1)
	if cen5dispxside == 0:
		cen5dispx = random.randi_range(-10, 0) + rad
	else:
		cen5dispx = random.randi_range(0, 10) - rad
	var cen5dispy = random.randi_range(-10, 10)
	var cen5 = Vector2(cen5dispx,height + cen5dispy)
	####6
	var rad6 = rad - random.randi_range(20, 30)
	var cen6dispx = 1
	var cen6dispxside = random.randi_range(0, 1)
	if cen6dispxside == 0:
		cen6dispx = random.randi_range(-10, 0) + rad
	else:
		cen6dispx = random.randi_range(0, 10) - rad
	var cen6dispy = random.randi_range(-10, 10)
	var cen6 = Vector2(cen6dispx,height + cen6dispy)
	####7
	var rad7 = rad - random.randi_range(20, 30)
	var cen7dispx = 1
	var cen7dispxside = random.randi_range(0, 1)
	if cen7dispxside == 0:
		cen7dispx = random.randi_range(-10, 0) + rad
	else:
		cen7dispx = random.randi_range(0, 10) - rad
	var cen7dispy = random.randi_range(-10, 10)
	var cen7 = Vector2(cen7dispx,height + cen7dispy)
	####8
	var rad8 = rad - random.randi_range(20, 30)
	var cen8dispx = 1
	var cen8dispxside = random.randi_range(0, 1)
	if cen8dispxside == 0:
		cen8dispx = random.randi_range(-10, 0) + rad
	else:
		cen8dispx = random.randi_range(0, 10) - rad
	var cen8dispy = random.randi_range(-10, 10)
	var cen8 = Vector2(cen8dispx,height + cen8dispy)
	
	
	
	var colg = random.randf_range(0.3, 0.8)
	var colr = random.randf_range(0.1, 0.5)
	var colb = random.randf_range(0.0, 0.3)
	var col = Color(colr,colg,colb)
	
	
	#var radout = rad + 2
	#var colout = Color(0.1,0.5,0.1)
	#draw_circle(cen,radout,colout)
	
	draw_circle(cen,rad,col)
	draw_circle(cen2,rad2,col)
	draw_circle(cen3,rad3,col)
	draw_circle(cen4,rad4,col)
	
	draw_circle(cen5,rad5,col)
	draw_circle(cen6,rad6,col)
	draw_circle(cen7,rad7,col)
	draw_circle(cen8,rad8,col)
