extends CharacterBody2D

const JUMP_VELOCITY = -600.0
var dead = false

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = 1500
var rotation_speed = 1.2

func _ready():
	position.x = 200
	position.y = 400

func _physics_process(delta):
	# Add the gravity.
	velocity.y += gravity * delta
	rotate((int(velocity.y > 0)*2 - 1)*delta*rotation_speed)
	rotation = clamp(rotation,-PI*0.1,PI*0.4)
	
	# Handle Jump.
	if Input.is_action_just_pressed("ui_select") and not dead:
		velocity.y = JUMP_VELOCITY
	move_and_slide()

func kill():
	dead = true
	get_node("../../").reset()
