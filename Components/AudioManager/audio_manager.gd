extends Node

var sounds : Array[AudioStreamPlayer2D]

func _ready() -> void:
	sounds.assign(get_children())
	play_sound("Music")

func play_sound(sound_name : String, pitch : float = -1):
	for sound in sounds:
		if sound.name == sound_name:
			if pitch != -1:
				sound.pitch_scale = pitch
			sound.play()
			
			return
	
	push_error("No Sound Found With Name " + sound_name)
