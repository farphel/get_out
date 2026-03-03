extends Node2D

@onready var ui = $CanvasLayer/Uimenu
@onready var exit_sound = $ExitSound
@onready var caught_sound = $CaughtSound
@onready var obstacle = $Obstacle
@onready var mob = $Mob
var screen_size

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	$Obstacle.position.x = randf_range(screen_size.x / 2 - 100, screen_size.x / 2 + 100)
	$Obstacle.position.y = randf_range(screen_size.y / 2 - 100, screen_size.y / 2 + 100)
	if GameManager.number_of_attempts == 0:
		ui.show_start_screen()
	await get_tree().create_timer(1.5).timeout
	mob.set_physics_process(true)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _on_exit_body_entered(body):
	if body.name == "Player":
		exit_sound.play()
		GameManager.escapes += 1
		GameManager.mob_speed = GameManager.mob_speed * (1 + GameManager.speed_up_percent)
		restart_game()

func _on_mob_player_caught():
	caught_sound.play()
	restart_game()

func restart_game():
	ui.show_results_screen()
	get_tree().paused = true

func _on_uimenu_start_pressed():
	ui.hide()
	get_tree().paused = false
	GameManager.number_of_attempts += 1
	get_tree().reload_current_scene()
