extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5
@export var MouseSens = 0.4
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
func _input(event):
	if event is InputEventMouseMotion:
		rotate_y(deg_to_rad(-event.relative.x * MouseSens))
		$Camera3D.rotate_x(deg_to_rad(-event.relative.y * MouseSens))
func _physics_process(delta):

	# Handle Jump.
	if Input.is_action_pressed("ui_up"):
		position.y += JUMP_VELOCITY * MouseSens
	if Input.is_action_pressed("ui_down"):
		position.y -= JUMP_VELOCITY * MouseSens
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("left", "right", "forward", "backward")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
		
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
