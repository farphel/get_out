extends CharacterBody2D

@export var speed = 225.0
@export var acceleration = 2.0
@export var deceleration = 10.0
@export var stare_precision = 0.7 # 0.5 (loose), 0.9 (precise)

var chase_color = Color(1, 1,1)
var frozen_color = Color(0,2,7)

@onready var sprite = $Sprite2D
@onready var player = get_tree().get_first_node_in_group("player")

func _ready():
	position.x = 200
	position.y = 500

func _physics_process(delta):
	
	if not player:
		return

	## BEGIN: Mob halts when Player faces them
	var dir_to_player = global_position.direction_to(player.global_position)
	var dir_from_player_to_mob = player.global_position.direction_to(global_position)
	var player_velocity_dir = player.velocity.normalized()
	
	var player_approaching = player_velocity_dir.dot(dir_from_player_to_mob) > 0.7
	
	var target_velocity = Vector2.ZERO
	
	if player_approaching:
		# Player is moving toward Mob -> Stop Mob
		target_velocity = Vector2.ZERO
		velocity = velocity.lerp(target_velocity, deceleration * delta)
		sprite.modulate = sprite.modulate.lerp(frozen_color, 0.1)
	else:
			# Player is moving away/sideways -> Mob Chase!
			target_velocity = dir_to_player * speed
			velocity = velocity.lerp(target_velocity, acceleration * delta)
			sprite.modulate = sprite.modulate.lerp(chase_color, 0.1)
	## END: Mob halts when Player faces them

	## BEGIN: Mob always chases Player
	#var direction = global_position.direction_to(player.global_position)
	#velocity = velocity.lerp(direction * speed, acceleration * delta)
	## END: Mob always chases Player
	
	move_and_slide()
	check_for_player_collision()

func check_for_player_collision():
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		var collider = collision.get_collider()
		if collider.name == "Player":
			print("Caught!!")
			get_tree().reload_current_scene() # restart the game
