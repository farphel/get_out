extends Control

signal start_pressed

@onready var score_label: Label = $VBoxContainer/ScoreLabel
@onready var title_label: Label = $VBoxContainer/TitleLabel
@onready var start_button: Button = $VBoxContainer/HBoxContainer/StartButton

# this is a test
func _ready():
	start_button.grab_focus()
	
func show_start_screen():
	self.show()
	title_label.text = "Get Out!"
	score_label.hide()
	start_button.text = "  Start  "
	start_button.grab_focus()
	get_tree().paused = true

func show_results_screen():
	self.show()
	title_label.text = "Get Out!"
	score_label.text = "Score: " + GameManager.get_stats_text()
	score_label.show()
	start_button.text = "  Go Again  "
	start_button.grab_focus()
	get_tree().paused = true

func _on_start_button_pressed() -> void:
	print("Start button pressed")
	self.hide()
	get_tree().paused = false
	start_pressed.emit()

func _on_quit_button_pressed() -> void:
	#print("Quit button pressed")
	get_tree().quit(0)