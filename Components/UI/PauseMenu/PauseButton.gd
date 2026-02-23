extends Button

func _ready() -> void:
	var pause_menu = get_tree().get_first_node_in_group("PauseMenu")
	if pause_menu != null:
		connect("pressed", pause_menu.pause)
