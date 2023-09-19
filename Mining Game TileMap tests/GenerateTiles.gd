extends TileMap

# TODO: Get All Tiles In A Radius

@export var MapWidth = 100;
@export var MapHeight = 100;
@export var MapSize = MapWidth * MapHeight;
@export var firstRun : bool = false
@export var PlacedMines : Array[Vector2i]
@export var PlacedMines_testing : Array[Vector2i]
@export var mines2Make = 10
@export var Radius : int = 3


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
	
	
	if firstRun == true:
		
		set_cell( 0, RandomSpot, 0, Vector2i(1,0), 0)
		PlacedMines.append(RandomSpot)
		PlacedMines_testing.append(RandomSpot)
		firstRun = false
	else:
		if GetAllPointsAroundTile(RandomSpot) == true:
			#set_cell( 0, Vector2i(RandomSpot_X,RandomSpot_Y), 0, Vector2i(1,1), 0)
			PlacedMines.append(RandomSpot)
			PlacedMines_testing.append(RandomSpot)
		else:
			createMines()
func GetAllPointsAroundTile(spot : Vector2i):
	var tempArrayForAmtCorrect = []
	#Get Top Left Coord
	# TODO: Iterate Over Row
	var currentX
	var currentY
	var TopLeftCoord = Vector2i(spot.x - Radius, spot.y + Radius)
	for y in range(TopLeftCoord.y, TopLeftCoord.y + (Radius * 2)):
		currentY = y
		for x in range(TopLeftCoord.x, TopLeftCoord.x + (Radius * 2)):
			currentX = x
			if PlacedMines.has(Vector2i(x,y)):
				tempArrayForAmtCorrect.append(Vector2i(x,y))
	if tempArrayForAmtCorrect.size() !=( (7 * 7 ) - 1):
		set_cell( 0, Vector2i(currentX,currentY), 0, Vector2i(0,1), 0)
		return true
	else:
		return false
	
func _ready():
	createBaseGrid()
	for i in range(0, mines2Make):
		createMines()
	print("SIZE" + str(PlacedMines_testing.size()))
	#SetupMap_NoMods()
	
	
		
			
			# set_cell( 0, Vector2(x,y), 0, CellID, 0)
			
		
	
