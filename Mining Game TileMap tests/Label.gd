extends Label

func _process(delta: float) -> void:
	#print("FPS %d" % Engine.get_frames_per_second())
	set_text("FPS %d" % Engine.get_frames_per_second())
