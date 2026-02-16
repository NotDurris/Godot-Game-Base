class_name Level
extends Node

signal level_changed(target_level_name, transition_type)

@export var current_level : String = "level"
@export var next_level : String = "level"
@export var level_value : int = 0

func Cleanup():
	call_deferred("queue_free")

func ChangeScene(target_level_name : String, transition_type : int = 0) -> void:
	emit_signal("level_changed", target_level_name, transition_type)
