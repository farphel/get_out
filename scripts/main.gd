extends Node2D

@onready var game_over_screen = $UI/CaughtScreen

# Called when the node enters the scene tree for the first time.
func _ready():
	game_over_screen.hide()

func trigger_game_over():
	game_over_screen.show()
	get_tree().paused = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _on_exit_body_entered(body):
	if body.name == "Player":
		print("You escaped!!")
		win_game()

func win_game():
	get_tree().paused = true
	await get_tree().create_timer(2.0).timeout
	get_tree().paused = false
	get_tree().reload_current_scene()


func _on_button_pressed():
	get_tree().paused = false
	get_tree().reload_current_scene()
