extends CharacterBody2D

@export var speed: float = 200
@export var friction: float = 10.0
@export var acceleration: float = 10.0

func _ready():
	position.x = 600
	position.y = 300

# this is a test of the Vim plugin
# this is a test of the Vim plugin
# this is a test of the Vim plugin
# this is a test of the Vim plugin
# this is a test of the Vim plugin
# this is a test of the Vim plugin
# this is a test of the Vim plugin
# this is a test of the Vim plugin
# this is a test of the Vim plugin
# this is a test of the Vim plugin
# this is a test of the Vim plugin
func _physics_process(delta):

	var direction := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	if direction:
		velocity = velocity.lerp(direction * speed, acceleration * delta)
	else:
		velocity = velocity.lerp(Vector2.ZERO, friction * delta)

	move_and_slide()
