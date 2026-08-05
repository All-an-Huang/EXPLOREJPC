extends Control

@onready var quit_menu = $"quit confirmation"

func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/mode_selection.tscn")

func _on_options_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/options_menu.tscn")

func _on_quit_button_pressed() -> void:
	quit_menu.quitmenu()
