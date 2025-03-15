extends CharacterBody3D

const SPEED = 4.0
const JUMP_VELOCITY = 4.5

##### mostly sprite stuff
var _position_last_frame := Vector3()
@onready var anim = $playersprite
var currentdir = "up_idle"
var moving = 0
var dialboxopenPlayerSide : bool

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _input(event):
	##### exit & restart (remove eventually)
	if event.is_action_pressed("exit"):
		get_tree().quit()
	if event.is_action_pressed("restart"):
		get_tree().reload_current_scene()
	######## turn camera
	if event.is_action_pressed("rightTurn"):
		#rotation.y += 2
		pass
	if event.is_action_pressed("leftTurn"):
		#rotation.y -= 2
		pass
	############# sprite animation direction
	if event.is_action_pressed("right"):
		currentdir = "right_idle"
		moving += 1
	if event.is_action_released("right"):
		moving -= 1
		
	if event.is_action_pressed("left"):
		moving += 1
		currentdir = "left_idle"
	if event.is_action_released("left"):
		moving -= 1
		
	if event.is_action_pressed("down"):
		moving += 1
		currentdir = "down_idle"
	if event.is_action_released("down"):
		moving -= 1
		
	if event.is_action_pressed("up"):
		moving += 1
		currentdir = "up_idle"
	if event.is_action_released("up"):
		moving -= 1

func _physics_process(delta):
	
	### gets movement by comparing its position to last frame
	## (because other motion data is in fancy physics stuff)
	var motion = position - _position_last_frame
	_position_last_frame = position
	
	######### animations
	## up
	if motion.z < 0:
		## right
		if motion.x > 0:
			anim.play("right_walk")
			currentdir = "right_idle"
		## left
		elif motion.x < 0:
			anim.play("left_walk")
			currentdir = "left_idle"
		else:
			anim.play("up_walk")
			currentdir = "up_idle"
	## down
	if motion.z > 0:
		## right
		if motion.x > 0:
			anim.play("right_walk")
			currentdir = "right_idle"
		## left
		elif motion.x < 0:
			anim.play("left_walk")
			currentdir = "left_idle"
		else:
			anim.play("down_walk")
			currentdir = "down_idle"
	
	## left
	if motion.x < 0:
		anim.play("left_walk")
		currentdir = "left_idle"
	## right
	if motion.x > 0:
		anim.play("right_walk")
		currentdir = "right_idle"
		
	if moving == 0:
		anim.play(currentdir)
	
	
	
	############## preset
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	## Handle Jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = JUMP_VELOCITY

	## Get the input direction and handle the movement/deceleration.
	var input_dir = Input.get_vector("left", "right", "up", "down")
	var direction = Vector3(input_dir.x, 0, input_dir.y).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
	
	
	#### stops player from walking when the dialogue box is open
	if dialboxopenPlayerSide == true:
		velocity = Vector3(0,0,0)


	move_and_slide()

## updates varaible to know whether or not the dialogue box is open
func _on_dialoguebox_dialboxstatus(dialboxopen):
	dialboxopenPlayerSide = dialboxopen
