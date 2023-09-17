extends Node


class BeeBox_Types:
	var Name
	var PartsInColllection : Array

@export var CollectionArray = [BeeBox_Types.new()]

@export var CollectionUsingIndex = 0
func _ready():
	for i in CollectionArray.size():
		print(i)
		
	
