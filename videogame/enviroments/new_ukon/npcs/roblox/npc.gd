extends AnimatedSprite3D

var dialogue = "HEY      EVERY      !! IT'S ME!! YOU'rE FAVORITE                        [[RobloxNoobFaceAt3AM]]                                                                DO YOU HAVE ANY SPARE [Fr33 R0bux!] FOR A [[ blocky man]] LIKE ME???"

var _position_last_frame := Vector3()
var currentdir : String
var direction = 1
var moving = 0

const SPEED = 1.0
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

#### if player is in range to speak to npc, "in area" = true
var inarea = false

signal interacted(text)

func _input(event):
	if event.is_action_pressed("interact"):
		if inarea == true:
			interacted.emit(dialogue)

## updates if player in range to speak to npc
func _on_npc_area_body_entered(body):
	if body.name == "player":
		inarea = true
func _on_npc_area_body_exited(body):
	if body.name == "player":
		inarea = false

func _physics_process(delta):
	##### makes npc move in random directions by changing its coordinate positions instead of using actual physics
	##### (npc can walk through walls)
	if direction == 1:
		position.x += SPEED*delta
	elif direction == 2:
		position.x -= SPEED*delta
	elif direction == 3:
		position.z += SPEED*delta
	elif direction == 4:
		position.z -= SPEED*delta
	var motion = position - _position_last_frame
	_position_last_frame = position
	
	######### animations
	## up
	if motion.z < 0:
		## right
		if motion.x > 0:
			play("right_walk")
			currentdir = "right_idle"
		## left
		elif motion.x < 0:
			play("left_walk")
			currentdir = "left_idle"
		else:
			play("up_walk")
			currentdir = "up_idle"
	## down
	if motion.z > 0:
		## right
		if motion.x > 0:
			play("right_walk")
			currentdir = "right_idle"
		## left
		elif motion.x < 0:
			play("left_walk")
			currentdir = "left_idle"
		else:
			play("down_walk")
			currentdir = "down_idle"
	
	## left
	if motion.x < 0:
		play("left_walk")
		currentdir = "left_idle"
	## right
	if motion.x > 0:
		play("right_walk")
		currentdir = "right_idle"
		
	if motion.x == 0:
		if motion.z == 0:
			play(currentdir)
	
	
	
	################################# all physics stuff from player
	# Add the gravity.
	#if not is_on_floor():
		#velocity.y -= gravity * delta
	## Handle Jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = JUMP_VELOCITY
	## Get the input direction and handle the movement/deceleration.
	#var input_dir = Input.get_vector("left", "right", "up", "down")
	#var direction = Vector3(input_dir.x, 0, input_dir.y).normalized()
	#if direction:
		#velocity.x = direction.x * SPEED
		#velocity.z = direction.z * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)
		#velocity.z = move_toward(velocity.z, 0, SPEED)

##### random changes npc direction
var rng = RandomNumberGenerator.new()
##(chooses between 1 and 6 even though he can only walk in 4 directions so sometimes he doesn't move)
func _on_walkrandom_timeout():
	direction = rng.randi_range(1, 6)
	
