extends Node2D

@onready var ui = $CanvasLayer/Uimenu

# Called when the node enters the scene tree for the first time.
func _ready():
	if GameManager.number_of_attempts == 0:
		ui.show_start_screen()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _on_exit_body_entered(body):
	if body.name == "Player":
		print("You escaped!")
		GameManager.escapes += 1
		restart_game()

func _on_mob_player_caught():
	restart_game()

func restart_game():
	ui.show_results_screen()
	print("stats: " + GameManager.get_stats_text())
	get_tree().paused = true

func _on_uimenu_start_pressed():
	print("in main via uimenu signal start_pressed")
	ui.hide()
	get_tree().paused = false
	GameManager.number_of_attempts += 1
	get_tree().reload_current_scene()
