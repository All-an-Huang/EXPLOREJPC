extends Node

signal objective_reached(building_name: String)
signal new_objective_chosen(building_name: String)

var building_pool: Array[Node] = []
var current_objective: Node = null

func choose_random_objective():
	building_pool = get_tree().get_nodes_in_group("classroom")
	
	if building_pool.is_empty():
		print("NULL")
		return
		
	current_objective = building_pool[randi() % building_pool.size()]
	new_objective_chosen.emit(current_objective.name)
	
func check_objective_reached(building: Node) -> void:
	if building == current_objective:
		objective_reached.emit(building.name)
		print("objective reached")
