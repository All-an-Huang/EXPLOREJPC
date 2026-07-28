extends Node

var building_pool: Array[Node] = []
var current_objective: Node = null

func choose_random_objective():
	building_pool = get_tree().get_nodes_in_group("classroom")
	
	if building_pool.is_empty():
		print("NULL")
		return
		
	current_objective = building_pool[randi() % building_pool.size()]
	print("Chosen objective: ", current_objective.name)
	
func check_objective_reached(building: Node) -> void:
	if building == current_objective:
		print("Objective reached")
