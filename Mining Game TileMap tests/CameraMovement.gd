extends Camera2D

@export var BasemoveAMT : int = 50
@export var moveAMT : int = 50
@export var Speed : int = 100
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# X = Left / Right
# Y = Up / Down 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if Input.is_action_pressed("speed"):
		moveAMT = Speed
	else:
		moveAMT = BasemoveAMT
	if Input.is_action_pressed("forward"):
		position.y -= moveAMT * delta
	if Input.is_action_pressed("backward"):
		position.y += moveAMT * delta
	if Input.is_action_pressed("right"):
		position.x += moveAMT * delta
	if Input.is_action_pressed("left"):
		position.x -= moveAMT * delta
		
