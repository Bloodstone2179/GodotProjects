extends Node2D

@export var tileMap : TileMap
@export var BuildTileMap : Array
@export var CurrentAtlasCoord_Placing : Vector2i = Vector2i(3,0)
@export var NoneDestructiveParts : Array[Vector2i] = [Vector2i(1,0)]
@export var GridBounds : Vector2i = Vector2i(0,0)
@export var previousTilePos : Vector2i = Vector2i(0,0)

var TRACK_TOP_TO_RIGHT = Vector2i(0,1)
var TRACK_TOP_TO_BOTTOM = Vector2i(2,0)
var TRACK_LEFT_RIGHT = Vector2i(1,1)
var TRACK_TOP_TO_LEFT = Vector2i(1,1)
var TRACK_BOTTOM_RIGHT= Vector2i(0,2)
var TRACK_BOTTOM_LEFT = Vector2i(1,2)
var TRACK_CROSS_SECTION = Vector2i(1,2)
var TrackTypes = [TRACK_TOP_TO_RIGHT, TRACK_TOP_TO_BOTTOM, TRACK_LEFT_RIGHT, TRACK_TOP_TO_LEFT, TRACK_BOTTOM_RIGHT, TRACK_BOTTOM_LEFT, TRACK_CROSS_SECTION]
# Called when the node enters the scene tree for the first time.
func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	tileMap = $"../../BaseTileMap"
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	
	if Input.is_action_pressed("esc"):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	if Input.is_action_pressed("rebuild"):
		for x in range(0,BuildTileMap.size()):
			tileMap.set_cell(0, BuildTileMap[x][0], 0, BuildTileMap[x][1])
		BuildTileMap.clear()
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT):
		
		var mouse_position = get_global_mouse_position()
		var MapPositon = tileMap.local_to_map(mouse_position)
		if NoneDestructiveParts.has(tileMap.get_cell_atlas_coords(0, MapPositon)) == false:
			if MapPositon.x >= GridBounds.x and MapPositon.y >= GridBounds.y:
				tileMap.set_cell(0, MapPositon, 0, Vector2i(0,0))
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):	#
		var mouse_position = get_global_mouse_position()
		var MapPositon = tileMap.local_to_map(mouse_position)
		
		#print(MapPositon)
		if NoneDestructiveParts.has(tileMap.get_cell_atlas_coords(0, MapPositon)) == false and tileMap.get_cell_atlas_coords(0, MapPositon) != CurrentAtlasCoord_Placing:
			
			if MapPositon.x >= GridBounds.x and MapPositon.y >= GridBounds.y:
				if TrackTypes.has(tileMap.get_cell_atlas_coords(0, MapPositon)):
					BuildTileMap.append([MapPositon, tileMap.get_cell_atlas_coords(0, MapPositon)])	
				
				if MapPositon.x < previousTilePos.x or MapPositon.x > previousTilePos.x : # Placing a X axis tile
					#Checking If previous tile a was a down tile
					if tileMap.get_cell_atlas_coords(0, previousTilePos) == TRACK_TOP_TO_BOTTOM and tileMap.get_cell_atlas_coords(0, Vector2i(previousTilePos.x, previousTilePos.y - 1)) != TRACK_TOP_TO_BOTTOM:
						tileMap.set_cell(0, MapPositon, 0, TRACK_TOP_TO_RIGHT)
					tileMap.set_cell(0, MapPositon, 0, TRACK_LEFT_RIGHT)
				if  MapPositon.y < previousTilePos.y or MapPositon.y > previousTilePos.y:# Placing a Y axis tile
					tileMap.set_cell(0, MapPositon, 0, TRACK_TOP_TO_BOTTOM)
				previousTilePos = MapPositon
		# Get the mouse position in screen coordinates
		
		
		# Convert screen coordinates to world coordinates
	
