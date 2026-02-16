class_name MenuBtn
extends Button

@export var target_level : String
@export var level : Level

func ChangeLevel():
	level.ChangeScene(target_level)
