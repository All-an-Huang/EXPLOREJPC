extends Control

var paused = false

@onready var quit_menu = $"quit confirmation"
@onready var options_menu = $"options menu"

func _ready() -> void:
	process_mode = Node.PROCESS_MODE_WHEN_PAUSED
	options_menu.hide()
	hide()

func _on_resume_pressed() -> void:
	pausemenu()

func _on_options_pressed() -> void:
	options_menu.change_button()
	options_menu.show()

func _on_menu_pressed() -> void:
	get_tree().paused = false
	options_menu.change_button()
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

func _on_quit_pressed() -> void:
	quit_menu.quitmenu()

func pausemenu():
	paused = !paused
	if paused:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		show()
		get_tree().paused = true
	else:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		hide()
		get_tree().paused = false
