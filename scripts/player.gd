extends CharacterBody2D

@export var speed: float = 200
@export var friction: float = 10.0
@export var acceleration: float = 10.0
var screen_size

func _ready():
	screen_size = get_viewport_rect().size
	position.x = randf_range(650.0, screen_size.x - 100.0)
	position.y = randf_range(100.0, screen_size.y / 2 - 100.0)
	#print("Player start (x,y): %.2f, %.2f" % [position.x, position.y])

func _physics_process(delta):

	var direction := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	if direction:
		velocity = velocity.lerp(direction * speed, acceleration * delta)
	else:
		velocity = velocity.lerp(Vector2.ZERO, friction * delta)

	move_and_slide()
