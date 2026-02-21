class_name Pause_Menu
extends CanvasLayer

@onready var pause_menu = $Contents
@onready var background = $Background

var paused = false

var background_colour : Color

func _ready() -> void:
	hide()
	pause_menu.pivot_offset = pause_menu.size * 0.5
	background_colour = background.color

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("Pause"):
		if paused:
			unpause()
		else:
			pause()

func unpause():
	AudioManager.play_sound("MenuClose")
	get_tree().paused = false
	var tweener = create_tween()
	tweener.set_trans(Tween.TRANS_CUBIC)
	tweener.set_ease(Tween.EASE_IN)
	tweener.set_parallel()
	tweener.tween_property(pause_menu, "scale", Vector2.ZERO, 0.4)
	tweener.tween_property(background, "color", Color("4e3e5e00"), 0.4).set_trans(Tween.TRANS_EXPO)
	tweener.chain().tween_callback(hide)
	paused = false

func pause() -> void:
	AudioManager.play_sound("MenuOpen")
	get_tree().paused = true
	show()
	pause_menu.scale = Vector2.ZERO
	var tweener = create_tween()
	tweener.set_trans(Tween.TRANS_BACK)
	tweener.set_ease(Tween.EASE_OUT)
	tweener.set_parallel()
	tweener.tween_property(pause_menu, "scale", Vector2.ONE, 0.4)
	tweener.tween_property(background, "color", background_colour, 0.4).set_trans(Tween.TRANS_EXPO)
	paused = true
