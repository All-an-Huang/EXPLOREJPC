extends Control



func _on_self_pressed() -> void:
	GameSettings.current_mode = GameSettings.GameMode.SELF
	get_tree().change_scene_to_file("res://scenes/main_game.tscn")


func _on_guided_pressed() -> void:
	GameSettings.current_mode = GameSettings.GameMode.GUIDED
	get_tree().change_scene_to_file("res://scenes/main_game.tscn")


func _on_assessed_pressed() -> void:
	GameSettings.current_mode = GameSettings.GameMode.ASSESSED
	get_tree().change_scene_to_file("res://scenes/main_game.tscn")


func _on_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
