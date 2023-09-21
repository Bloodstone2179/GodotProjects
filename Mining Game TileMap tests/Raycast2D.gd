extends RayCast2D

@export var tileMap : TileMap
# Called when the node enters the scene tree for the first time.
func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	tileMap = $"../../BaseTileMap"
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if Input.is_action_pressed("esc"):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):	#
		var mouse_position = get_global_mouse_position()#
		print(mouse_position)	
		# Get the mouse position in screen coordinates
		
		
		# Convert screen coordinates to world coordinates
	
