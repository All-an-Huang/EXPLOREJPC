extends Control
@onready var pause = $"."
var paused = false

func _ready():
	print("Pause menu loaded")
	hide()
	process_mode = Node.PROCESS_MODE_WHEN_PAUSED

func _input(event):
	print("processing")
	if Input.is_action_just_pressed("pause"):
		print("PAUSED")
		pausemenu()


func _on_resume_pressed() -> void:
	pausemenu()


func _on_options_pressed() -> void:
	pass # Replace with function body.


func _on_menu_pressed() -> void:
	pass # Replace with function body.


func _on_quit_pressed() -> void:
	get_tree().quit()


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
