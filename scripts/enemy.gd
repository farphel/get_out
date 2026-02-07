extends CharacterBody2D

var speed = 150
var screen_size
var player = null

func _ready():
	position.x = 200
	position.y = 500
	screen_size = get_viewport_rect().size
	player = get_parent().get_node("Player")

func _physics_process(_delta):

	if player:
		var direction = global_position.direction_to(player.global_position)
		velocity = direction * speed
		move_and_slide()
		check_for_player_collision()

func check_for_player_collision():
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		var collider = collision.get_collider()
		if collider.name == "Player":
			print("Caught!!")
			#get_tree().reload_current_scene() # restart the game
			get_parent().trigger_game_over()
