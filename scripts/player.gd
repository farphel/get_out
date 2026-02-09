extends CharacterBody2D

var speed = 200
var screen_size

# Gemini suggestion
@export var friction = 10.0
@export var acceleration = 10.0

func _ready():
	position.x = 600
	position.y = 300
	screen_size = get_viewport_rect().size

func _physics_process(delta):
	# My original "working" version of Player movement.
	#velocity = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	#position += velocity * speed * delta
	#position = position.clamp(Vector2.ZERO, screen_size)
	
	# Gemini's suggestion
	var direction := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	if direction:
		velocity = velocity.lerp(direction * speed, acceleration * delta)
	else:
		velocity = velocity.lerp(Vector2.ZERO, friction * delta)

	move_and_slide()
