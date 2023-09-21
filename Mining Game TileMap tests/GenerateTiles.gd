extends TileMap

# TODO: Get All Tiles In A Radius

const TILE_EMPTY = 0  # Tile index for an empty cell
const TILE_MINE = 1  # Tile index for a mine
@export var grid_size = Vector2i(10, 10)
@export var firstRun : bool = false
@export var PlacedMines : Array[Vector2i]
@export var mines2Make : int
@export var Radius : int = 3
var GridArray = []

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
	
	for x in range( -(grid_size.x / 2), (grid_size.x / 2)):
		var Row = []
		for y in range(-(grid_size.y / 2), (grid_size.y / 2)):
			Row.append(0)
		GridArray.append(Row)
	
			
func createMines():
	var mines_placed = 0
	while mines_placed < mines2Make:
		var row = randi() % grid_size.y
		var col = randi() % grid_size.x
		if GridArray[row][col] == 0:
			# Check the 3x3 radius
			var valid_placement = true
			for i in range(max(0, row - 1), min(grid_size.y, row + (Radius - 1))):
				for j in range(max(0, col - 1), min(grid_size.x, col + (Radius - 1))):
					if GridArray[i][j] == TILE_MINE:
						valid_placement = false
						break
			
			if valid_placement:
				GridArray[row][col] = TILE_MINE
				mines_placed += 1
		
func update_tilemap(grid):
	# Clear existing tiles in the TileMap
	clear()
	# Update the TileMap with the generated grid
	for row in range(grid_size.y):
		for col in range(grid_size.x):
			if grid[row][col] == TILE_MINE:
				PlacedMines.append(Vector2i(col,row))
				set_cell(0, Vector2i(col,row), 0, Vector2i(1,0), 0)  # Set the mine tile
			else:
				set_cell(0, Vector2i(col,row), 0, Vector2i(0,0), 0)  
		

func _ready():
	createBaseGrid()
	createMines()
	update_tilemap(GridArray)
	#SetupMap_NoMods()
	
	
		
			
			# set_cell( 0, Vector2(x,y), 0, CellID, 0)
			
		
	
