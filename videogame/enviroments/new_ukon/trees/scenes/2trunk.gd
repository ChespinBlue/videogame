extends Line2D

func _input(event):
	if event.is_action_pressed("exit"):
		get_tree().quit()
	if event.is_action_pressed("test"):
		generateTree()



var random = RandomNumberGenerator.new()

var height = 0
var moved = 0
var branchcount = 1
var branchtopcount = 1
var treetype = 1



var end = Vector2(1,-10)
var leafn = 100
var leafsn = 1



func _ready():
	generateTree()

func generateTree():
	branchcount = random.randi_range(3, 8)
	branchtopcount = random.randi_range(2, 4)
	treetype = random.randi_range(1, 4)
	
	width = random.randi_range(8, 10)
	
	var seg1y = random.randi_range(-10*width, -2*width)
	var seg2y = random.randi_range(-80, -40) + seg1y
	var seg1x = random.randi_range(-3, 3)
	var seg2x = random.randi_range(-1, 1)
	height = seg2y
	moved = seg2y
	
	set_point_position(1, Vector2(get_point_position(0).x + seg1x, get_point_position(0).y + seg1y))
	set_point_position(2, Vector2(get_point_position(0).x + seg2x, get_point_position(0).y + seg2y))

func branchout(z):
	for i in range(z - 1):
		var startY = random.randi_range(0+(height*0.4), height + 10)
		var start = Vector2(0, startY)
		var endX = random.randi_range(-40, 40)
		var endY = random.randi_range(-40, -10)
		end = Vector2(endX, endY+height)
		var Bwidth = random.randi_range(4, 6)
		
		var colr = random.randf_range(0.4, 0.4)
		var colg = random.randf_range(0.3, 0.35)
		var colb = random.randf_range(0.2, 0.25)
		var color = Color(0.4,0.3,0.2)
		
		draw_line(start, end, color, Bwidth)
		
		
		leafn = random.randi_range(80, 120)
		var leafsn = random.randi_range(10, 20)
		
		leafoutshad(end, leafsn, treetype)
		#leafout(end, leafn, treetype, leafsn)
		

func branchtop(z):
	for i in range(z - 1):
		var start = Vector2(0, height + 5)
		var endX = random.randi_range(-40, 40)
		var endY = random.randi_range(-100, -70)
		var end = Vector2(endX, -20+height)
		var Bwidth = random.randi_range(4, 6)
		
		var colr = random.randf_range(0.4, 0.4)
		var colg = random.randf_range(0.3, 0.35)
		var colb = random.randf_range(0.2, 0.25)
		var color = Color(0.4,0.3,0.2)
		draw_line(start, end, color, Bwidth)
		
		var leafn = random.randi_range(80, 120)
		var leafsn = random.randi_range(10, 20)
		
		
		leafoutshad(end, leafsn, treetype)
		#leafout(end, leafn, treetype, leafsn)

func leafout(a, b, c, e):
	### end,
	#print("leaf")
	for i in range(e - 1):
		var scenX = random.randi_range(-30, 30)
		var scenY = random.randi_range(-30, 30)
		var scen = Vector2(scenX,scenY) + a
		var srad = random.randi_range(6, 10)
		var scolor = Color(0.1,0.8,0.3)
		if c == 4:
			scolor = Color(0.8,0.7,0.4)
		else:
			scolor = Color(0.1,0.8,0.3)
		draw_circle(scen,srad,scolor)
	
	
	
	for i in range(b - 1):
		var cenX = random.randi_range(-40, 40)
		var cenY = random.randi_range(-40, 40)
		var cen = Vector2(cenX,cenY) + a
		var rad = random.randi_range(1, 4)
		var color = Color(0.2,0.9,0.2)
		if c == 4:
			color = Color(0.9,0.8,0.4)
		else:
			color = Color(0.2,0.9,0.2)
		draw_circle(cen,rad,color)
	
func leafoutshad(a, e, c):
	### end,
	#print("shade")
	for i in range(e - 1):
		var scenX = random.randi_range(-30, 30)
		var scenY = random.randi_range(-30, 30)
		var scen = Vector2(scenX,scenY) + a
		var srad = random.randi_range(6, 10)
		var scolor = Color(0.1,0.8,0.3)
		if c == 4:
			scolor = Color(0.8,0.7,0.4)
		else:
			scolor = Color(0.1,0.8,0.3)
		draw_circle(scen,srad,scolor)

func _draw():
	#####circles
	var cen = Vector2(0,height)
	var rad = random.randi_range(0.3*abs(height), 0.5*abs(height))
	var rad2 = rad - random.randi_range(1, 8)
	var cen2dispx = random.randi_range(-10, 10)
	var cen2dispy = random.randi_range(-10, 10)
	var cen2 = Vector2(cen2dispx,height + cen2dispy)
	
	var colr = random.randf_range(0.1, 0.8)
	var colg = random.randf_range(0.3, 0.8)
	var colb = random.randf_range(0.0, 0.3)
	var col = Color(colr,colg,colb)
	
	######lines
	branchout(branchcount)
	branchtop(branchtopcount)
	
	
	#draw_circle(cen,rad,col)
	#draw_circle(cen2,rad2,col)
