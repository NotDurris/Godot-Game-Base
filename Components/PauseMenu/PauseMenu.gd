class_name Pause_Menu
extends Control

@export var pause_menu : Control
@export var background : ColorRect

var paused = false

func _ready() -> void:
	hide()

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("Pause"):
		if paused:
			unpause()
		else:
			pause()

func unpause():
	AudioManager.play_sound("Bells")
	get_tree().paused = false
	print("unpause")
	var tweener = create_tween()
	tweener.set_trans(Tween.TRANS_CUBIC)
	tweener.set_ease(Tween.EASE_IN)
	tweener.set_parallel()
	tweener.tween_property(pause_menu, "scale", Vector2.ZERO, 0.4)
	tweener.tween_property(background, "color", Color("4e3e5e00"), 0.4)
	tweener.chain().tween_callback(hide)
	paused = false

func pause() -> void:
	AudioManager.play_sound("Bells")
	get_tree().paused = true
	show()
	print("paused")
	pause_menu.scale = Vector2.ZERO
	var tweener = create_tween()
	tweener.set_trans(Tween.TRANS_BOUNCE)
	tweener.set_ease(Tween.EASE_OUT)
	tweener.set_parallel()
	tweener.tween_property(pause_menu, "scale", Vector2.ONE, 0.4)
	tweener.tween_property(background, "color", Color("4e3e5e8f"), 0.4)
	paused = true
