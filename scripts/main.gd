extends Node2D

@onready var ui = $CanvasLayer/UImenu

# Called when the node enters the scene tree for the first time.
func _ready():
	ui.show_start_screen()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _on_exit_body_entered(body):
	if body.is_in_group("player"):
		GameManager.escapes += 1
		ui.show_results_screen()

func _on_player_hit():
	ui.show_results_screen()
