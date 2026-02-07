extends Area2D

var speed = 200
var screen_size

# Called when the node enters the scene tree for the first time.
func _ready():
	#pass # Replace with function body.
	position.x = 300
	position.y = 300
	screen_size = get_viewport_rect().size

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO
	
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
