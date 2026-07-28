extends Control

var main_menu: bool = true

@onready var heading = $Panel/Heading
@onready var resume_button = $Panel/Resume

func _ready() -> void:
	$"Panel/Option 1".button_pressed = true
	$Panel/English.button_pressed = true

func _on_resume_pressed() -> void:
	if main_menu:
		get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
	else:
		change_button()
		hide()

func _on_sound_pressed() -> void:
	heading.text = "Sound"


func _on_display_pressed() -> void:
	heading.text = "Display"

func change_button():
	main_menu = !main_menu
	if main_menu:
		resume_button.text = "Main Menu"
	else:
		resume_button.text = "Resume"
