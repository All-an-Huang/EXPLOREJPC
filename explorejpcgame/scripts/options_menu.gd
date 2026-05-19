extends Control



func _on_resume_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")


func _on_sound_button_pressed() -> void:
	$"margin container/panel h box/panel/title".text = "Sound"


func _on_display_button_pressed() -> void:
	$"margin container/panel h box/panel/title".text = "Display"


func _on_option_1_toggled(toggled_on: bool) -> void:
	$"margin container/panel h box/panel/options panel/choice v box/choice h box/checkbox h box/option 2".button_pressed = false



func _on_option_2_toggled(toggled_on: bool) -> void:
	$"margin container/panel h box/panel/options panel/choice v box/choice h box/checkbox h box/option 1".button_pressed = false
