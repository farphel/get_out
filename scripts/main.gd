extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _on_exit_body_entered(body):
	if body.name == "Player":
		print("You escaped!")
		GameManager.escapes += 1
		restart_game()

func restart_game():
	GameManager.number_of_attempts += 1
	print(GameManager.get_stats_text())
	get_tree().paused = true
	await get_tree().create_timer(2.0).timeout
	get_tree().paused = false
	get_tree().reload_current_scene()
