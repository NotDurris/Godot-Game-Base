extends Button

@export var target_level : String
@export var level : Level

func _ready() -> void:
	pressed.connect(ChangeLevel)

func ChangeLevel():
	level.ChangeScene(target_level)
