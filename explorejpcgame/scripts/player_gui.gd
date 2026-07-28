extends Control

@export var minimap_rect:TextureRect

@onready var classroom_text = $MarginContainer/HBoxContainer/VBoxContainer/Panel/Classroom

func _ready() -> void:
	var minimap_viewport:SubViewport = get_tree().current_scene.get_node("MinimapViewport")
	if minimap_rect:
		minimap_rect.texture = minimap_viewport.get_texture()
		
	ObjectiveManager.choose_random_objective()
	update_classroom_label(ObjectiveManager.current_objective.name)

func _process(delta: float) -> void:
	classroom_text.text = ObjectiveManager.current_objective.name
	
func update_classroom_label(building_name: String) -> void:
	classroom_text.text = building_name
	
	var length = building_name.length()
	var font_size: int
	
	if length <= 2:
		font_size = 100
	elif length == 3:
		font_size = 75
	else:
		font_size = 60
	
	classroom_text.add_theme_font_size_override("normal_font_size", font_size)
