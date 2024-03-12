extends CharacterBody3D


const SPEED = 50
const JUMP_VELOCITY = 4.5

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var head;
func _ready():
	head = $Head
	pass


		

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	floor_snap_length = 1
	var input_dir = Vector3.ZERO;
	if Input.is_action_just_pressed("MOVE_FORWARD"):
		input_dir = Vector3.FORWARD
	if Input.is_action_just_pressed("MOVE_BACK"):
		input_dir = Vector3.BACK
	var direction = (head.transform.basis * input_dir).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
