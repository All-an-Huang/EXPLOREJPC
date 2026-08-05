extends Node3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if ObjectiveManager.current_objective and GameSettings.current_mode == GameSettings.GameMode.GUIDED:
		look_at(ObjectiveManager.current_objective.global_position, Vector3.UP)
	else:
		hide()
