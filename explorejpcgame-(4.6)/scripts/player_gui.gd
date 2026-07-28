extends Control

@export var minimap_rect:TextureRect

var classroom_text = $MarginContainer/HBoxContainer/VBoxContainer/Panel/Classroom

func _ready() -> void:
	var minimap_viewport:SubViewport = get_tree().current_scene.get_node("MinimapViewport")
	if minimap_rect:
		minimap_rect.texture = minimap_viewport.get_texture()
	ObjectiveManager.choose_random_objective()
	classroom_text.add_theme_font_size_override("normal_font_size", 100)

func _process(delta: float) -> void:
	classroom_text.text = ObjectiveManager.current_objective.name
