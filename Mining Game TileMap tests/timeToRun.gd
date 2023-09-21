extends Node

static var start = false
static var time : float = 0.0

static func StartTimer():
	start = true

static func StopTimer():
	start = false

func _process(delta):
	if start == true:
		
		time += delta 

static func GetTime():
	print("time" + str(time))
	return time

