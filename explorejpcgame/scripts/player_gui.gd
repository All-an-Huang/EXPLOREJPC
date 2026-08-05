extends Control

@export var minimap_rect:TextureRect

@onready var classroom_text = $MarginContainer/HBoxContainer/VBoxContainer/Panel/Classroom
@onready var feedback_text = $MarginContainer/HBoxContainer/VBoxContainer/Panel/Feedback
@onready var timer_text = $Panel/TimerText
@onready var timer_panel = $Panel
@onready var objective_panel = $MarginContainer/HBoxContainer/VBoxContainer/Panel
@onready var objective_text = $MarginContainer/HBoxContainer/VBoxContainer/Panel/RichTextLabel

var time_limit: float = 10.0
var time_remaining: float = 0.0
var timer_active: bool = false

func _ready() -> void:
	feedback_text.hide()
	
	var minimap_viewport:SubViewport = get_tree().current_scene.get_node("MinimapViewport")
	if minimap_rect:
		minimap_rect.texture = minimap_viewport.get_texture()
	
	ObjectiveManager.objective_reached.connect(_on_objective_reached)
	ObjectiveManager.new_objective_chosen.connect(_on_new_objective_chosen)
	
	setup_mode()

func setup_mode() -> void:
	var has_objective = GameSettings.current_mode != GameSettings.GameMode.SELF
	var has_timer = GameSettings.current_mode == GameSettings.GameMode.ASSESSED
	
	timer_text.visible = has_timer
	timer_panel.visible = has_timer
	objective_panel.visible = has_objective
	objective_text.visible = has_objective
	classroom_text.visible = has_objective
	
	if has_objective:
		ObjectiveManager.choose_random_objective()
	
	if has_timer:
		start_timer(time_limit)

func _on_objective_reached(building_name: String) -> void:
	timer_active = false
	await show_feedback("Congratulations for finding %s!" % building_name)
	ObjectiveManager.choose_random_objective()
	if GameSettings.current_mode == GameSettings.GameMode.ASSESSED:
		start_timer(time_limit)

func _on_time_up() -> void:
	await show_feedback("Failed to locate %s" % ObjectiveManager.current_objective.name)
	ObjectiveManager.choose_random_objective()
	start_timer(time_limit)

func show_feedback(message: String) -> void:
	classroom_text.hide()
	feedback_text.show()
	feedback_text.text = message
	await get_tree().create_timer(3.0).timeout
	classroom_text.show()
	feedback_text.hide()

func _on_new_objective_chosen(building_name: String) -> void:
	update_classroom_label(building_name)
	
func update_classroom_label(building_name: String) -> void:
	classroom_text.text = building_name
	
	var length = building_name.length()
	var font_size: int
	
	if length <= 2:
		font_size = 100
	elif length == 3:
		font_size = 75
	elif length == 4:
		font_size = 60
	else:
		font_size = 40
	
	classroom_text.add_theme_font_size_override("normal_font_size", font_size)

func start_timer(duration: float) -> void:
	time_remaining = duration
	timer_active = true

func _process(delta: float) -> void:
	if timer_active:
		time_remaining -= delta
		timer_text.text = str(int(ceil(time_remaining)))
		
		if time_remaining <= 0:
			timer_active = false
			time_remaining = 0
			_on_time_up()
