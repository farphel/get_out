extends CharacterBody2D

var speed = 200
var screen_size

func _ready():
	position.x = 600
	position.y = 300
	screen_size = get_viewport_rect().size

func _physics_process(delta):
	
	velocity = Vector2.ZERO
	
	if Input.is_action_pressed("ui_left"):
		velocity = Vector2.LEFT
	if Input.is_action_pressed("ui_right"):
		velocity = Vector2.RIGHT
	if Input.is_action_pressed("ui_up"):
		velocity = Vector2.UP
	if Input.is_action_pressed("ui_down"):
		velocity = Vector2.DOWN
	if Input.is_action_pressed("ui_left") and Input.is_action_pressed("ui_up"):
		velocity = Vector2.LEFT + Vector2.UP
	if Input.is_action_pressed("ui_left") and Input.is_action_pressed("ui_down"):
		velocity = Vector2.LEFT + Vector2.DOWN
	if Input.is_action_pressed("ui_right") and Input.is_action_pressed("ui_up"):
		velocity = Vector2.RIGHT + Vector2.UP
	if Input.is_action_pressed("ui_right") and Input.is_action_pressed("ui_down"):
		velocity = Vector2.RIGHT + Vector2.DOWN
	
	position += velocity * speed * delta
	position = position.clamp(Vector2.ZERO, screen_size)

	move_and_slide()
