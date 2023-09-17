extends TileMap


@export var MapWidth = 100;
@export var MapHeight = 100;
@export var MapSize = MapWidth * MapHeight;
@export var firstRun : bool = false
@export var PlacedMines : Array[Vector2i]
@export var PlacedMines_testing : Array[Vector2i]
@export var mines2Make = 10


#func SetupMap_NoMods():
#	print("Expected Mines %d" % ((MapSize/ 10) / MineDensityPer10Tiles))
#	for x in range( -(MapWidth / 2), (MapWidth / 2)):
#		for y in range(-(MapHeight / 2), (MapHeight / 2)):
#			var randomNum = (randi_range(0,(MapSize/ 10) / MineDensityPer10Tiles))
#			if randomNum < 6:
#				set_cell( 0, Vector2i(x,y), 0, Vector2i(1,0), 0)
#			if randomNum >= 6:
#				set_cell( 0, Vector2i(x,y), 0, Vector2i(0,0), 0)
			


func createBaseGrid():
	for x in range( -(MapWidth / 2), (MapWidth / 2)):
		for y in range(-(MapHeight / 2), (MapHeight / 2)):
			set_cell( 0, Vector2i(x,y), 0, Vector2i(0,0), 0)
			
func createMines():
	#PickRandomSpotOnMap
	var RandomSpot_X = randi_range(-(MapWidth / 2), (MapWidth / 2))
	var RandomSpot_Y = randi_range(-(MapHeight / 2), (MapHeight / 2))
	var RandomSpot = Vector2i(RandomSpot_X, RandomSpot_Y)
	print(RandomSpot)
	if RandomSpot_X > (MapWidth / 2):
		print(RandomSpot)
		print("Not In The Bounds (X)")
		createMines()
	if RandomSpot_Y > (MapHeight / 2):
		print(RandomSpot)
		print("Not In The Bounds (Y)")
		createMines()
	if RandomSpot_X < -(MapWidth / 2):
		print(RandomSpot)
		print("Not In The Bounds (-X)")
		createMines()
	if RandomSpot_Y < -(MapHeight / 2):
		print(RandomSpot)
		print("Not In The Bounds (-Y)")
		createMines()
	else:
		if firstRun == true:
			
			set_cell( 0, RandomSpot, 0, Vector2i(1,0), 0)
			PlacedMines.append(RandomSpot)
			PlacedMines_testing.append(RandomSpot)
			firstRun = false
		else:
			for tile in range(0, PlacedMines.size()):
				#   |\
				#   | \   
				# b |  \   c
				#   |   \
				#    ----
					#  A
				var a = RandomSpot.y - PlacedMines[tile].y
				var b = RandomSpot.x - PlacedMines[tile].x
				a = a * a
				b = b * b
				var c = sqrt(a + b)
				#print(c)
				if c <= 3:
					#print("Less Than 3")
					createMines()
				else:
					PlacedMines.remove_at(tile)
					#print("Greater than 3")
					set_cell( 0, RandomSpot, 0, Vector2i(1,0), 0)
					PlacedMines.append(RandomSpot)
					PlacedMines_testing.append(RandomSpot)
				#var distanceToTile = 
	
	
func _ready():
	createBaseGrid()
	for i in range(0, mines2Make):
		createMines()
	print(PlacedMines_testing)
	print(PlacedMines_testing.size())
	#SetupMap_NoMods()
	
	
		
			
			# set_cell( 0, Vector2(x,y), 0, CellID, 0)
			
		
	
