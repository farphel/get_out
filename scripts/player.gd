extends CharacterBody2D

var speed = 200
var screen_size

func _ready():
	position.x = 600
	position.y = 300
	screen_size = get_viewport_rect().size

func _physics_process(delta):
	
	velocity = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")	
	position += velocity * speed * delta
	position = position.clamp(Vector2.ZERO, screen_size)

	move_and_slide()
