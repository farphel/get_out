extends Control

signal start_pressed

@onready var score_label = $VBoxContainer/ScoreLabel
@onready var title_label = $VBoxContainer/TitleLabel
@onready var start_button = $VBoxContainer/HBoxContainer/StartButton
@onready var quit_button = $VBoxContainer/HBoxContainer/QuitButton

func show_start_screen():
	show()
	title_label.text = "Get Out!"
	score_label.hide()
	start_button.text = "Start"
	quit_button.text = "Quit"
	get_tree().paused = true

func show_results_screen():
	show()
	title_label.text = "Game Over"
	score_label.text = "Success Rate: " + GameManager.get_stats_text()
	score_label.show()
	start_button.text = "Go Again"
	quit_button.text = "Give Up"
	get_tree().paused = true

func _on_start_button_pressed():
	GameManager.number_of_attempts += 1
	hide()
	get_tree().paused = false
	start_pressed.emit()

func _on_quit_button_pressed():
	get_tree().quit()
