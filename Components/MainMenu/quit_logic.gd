extends Button

func _ready():
	match OS.get_name():
		"Web":
			hide()
		_ :
			show()
			pressed.connect(quit)

func quit():
	get_tree().quit()
