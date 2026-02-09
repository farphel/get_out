extends CharacterBody2D

@export var speed = 150.0
@export var acceleration = 2.0
var screen_size
var player = null

func _ready():
	position.x = 200
	position.y = 500
	screen_size = get_viewport_rect().size
	#player = get_parent().get_node("Player")
	
	## Gemini: go to Player scene, go to Inspector->Groups, Add "player"
	player = get_tree().get_first_node_in_group("player")

func _physics_process(delta):

	if player:
		var direction = global_position.direction_to(player.global_position)
		#velocity = direction * speed  ### original version, not using `lerp`
		velocity = velocity.lerp(direction * speed, acceleration * delta)
		move_and_slide()
		check_for_player_collision()

func check_for_player_collision():
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		var collider = collision.get_collider()
		if collider.name == "Player":
			print("Caught!!")
			#get_tree().reload_current_scene() # restart the game
