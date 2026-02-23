class_name Pause_Menu
extends CanvasLayer

@onready var pause_menu : UIPanel = $Pause_UIPanel

func _ready() -> void:
	pause_menu.on_panel_close_button_clicked.connect(func() : paused = false)

var paused = false :
	set(value):
		paused = value
		if paused:
			do_pause()
		else:
			do_unpause()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Pause"):
		paused = not paused
		if not paused:
			pause_menu.close_panel()

func do_unpause():
	AudioManager.play_sound("MenuClose")
	get_tree().paused = false

func do_pause() -> void:
	AudioManager.play_sound("MenuOpen")
	get_tree().paused = true
	
	pause_menu.open_panel()
