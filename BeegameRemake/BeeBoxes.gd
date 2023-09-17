extends Node

class Testing:
	var Aval : Vector3 = Vector3.ZERO
	var ocupied : bool = false

@export var Spots = [[Vector3.ZERO, false]]
@export var BeesInBox = 0
@export var HoneyProduced = 0

var TempArray = Testing.new()


func _ready():
	AddHoney(12)
	TempArray.ocupied = true
	print(TempArray.ocupied)
	Spots.append(TempArray)
	print("SPOTS 1")
	print(Spots[0])
	
func AddHoney(amount : int) :
	HoneyProduced += amount
	
