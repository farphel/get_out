extends Area2D

var speed = 200
var screen_size
var player = null

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	position.x = 800
	position.y = 400
	screen_size = get_viewport_rect().size

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO
	
	player = get_node_or_null("../Player")
	
	if player:
		velocity = position.direction_to(player.position)
	
	position += velocity * speed * delta
	position = position.clamp(Vector2.ZERO, screen_size)
