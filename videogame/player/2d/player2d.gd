extends CharacterBody2D

@onready var sprite = $AnimatedSprite2D

const SPEED = 400.0
const ACCEL = 100.0

var input: Vector2
var currentdir = "up_idle"

func get_input():
	input.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	input.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	
	############################################ display sprite animation
	### up and down
	if input.y == 1 and input.x == 0:
		sprite.play("down_walk")
		currentdir = "down_idle"
	elif input.y == -1 and input.x == 0:
		sprite.play("up_walk")
		currentdir = "up_idle"
	#### left and right
	if input.x == 1:
		sprite.play("right_walk")
		currentdir = "right_idle"
	elif input.x == -1:
		sprite.play("left_walk")
		currentdir = "left_idle"
	### idle
	if input == Vector2(0,0):
		sprite.play(currentdir)
	
	return input.normalized()

func _process(delta):
	var playerInput = get_input()
	
	velocity = lerp(velocity, playerInput * SPEED, delta * ACCEL)
	
	move_and_slide()
