extends Control

var paused = false

func _ready() -> void:
	hide()
	
func _on_yes_pressed() -> void:
	get_tree().quit()


func _on_no_pressed() -> void:
	quitmenu()

func quitmenu():
	paused = !paused
	if paused:
		show()
	else:
		hide()
