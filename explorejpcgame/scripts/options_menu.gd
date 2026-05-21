extends Control

func _ready() -> void:
	$"margin container/side panel h box/side panel v box/language panel/checkbox h box/checkbox v box/english".button_pressed = true
	$"margin container/panel h box/panel/options panel/choice v box/choice h box/checkbox h box/option 1".button_pressed = true

func _on_resume_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")


func _on_sound_button_pressed() -> void:
	$"margin container/panel h box/panel/title".text = "Sound"


func _on_display_button_pressed() -> void:
	$"margin container/panel h box/panel/title".text = "Display"
