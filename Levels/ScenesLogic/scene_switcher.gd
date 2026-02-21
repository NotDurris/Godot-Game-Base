extends Node

@export var current_level : Level
@onready var anim : AnimationPlayer = $AnimationPlayer

var next_level : Level = null

func _ready() -> void:
	current_level.connect("level_changed", handle_level_changed)

func handle_level_changed(next_level_name : String, transition : int):
	var new_level_path : String = "res://Levels/" + next_level_name + ".tscn"
	if not ResourceLoader.exists(new_level_path):
		print("Level with name, " + next_level_name + " does not exist")
		return
	
	var next_level_reference : PackedScene = load(new_level_path)
	next_level = next_level_reference.instantiate()
	get_tree().paused = true
	if transition == 0:
		anim.play("transition_out")
	else:
		anim.play("cat_out")
	next_level.connect("level_changed", handle_level_changed)


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	match anim_name:
		"transition_out":
			current_level.Cleanup()
			add_child(next_level)
			current_level = next_level
			next_level = null
			anim.play("transition_in")
		"cat_out":
			current_level.Cleanup()
			add_child(next_level)
			current_level = next_level
			next_level = null
			anim.play("transition_in")
		"transition_in":
			get_tree().paused = false
