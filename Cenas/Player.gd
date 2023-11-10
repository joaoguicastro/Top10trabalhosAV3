extends KinematicBody2D

onready var animated_sprite = $AnimatedSprite

var speed = 200 
var jump_force = -400 
var gravity = 98 * 60
var velocity = Vector2()
var jump_decay = 20  

func _physics_process(delta):
	handle_movement(delta)
	handle_animation()

func handle_movement(delta):
	velocity.x = 0

	if Input.is_action_pressed("ui_right"):
		velocity.x = speed
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -speed

	if is_on_floor() and Input.is_action_just_pressed("ui_up"):
		velocity.y = jump_force

	if not is_on_floor():
		if velocity.y < 0:  
			velocity.y += jump_decay  
		else:
			velocity.y += gravity * delta  
		
	move_and_slide(velocity, Vector2.UP)


func handle_animation():
	if velocity.x == 0:
		animated_sprite.play("idle")
		
	if Input.is_action_pressed("ui_attack"):
		animated_sprite.play("Attack")
	if Input.is_action_pressed("ui_right"):
		animated_sprite.play("Run")


