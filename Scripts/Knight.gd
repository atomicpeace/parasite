extends CharacterBody3D

var pause_menu = preload("res://Scenes/pause_menu.tscn")
var pauseInstance;
var paused = false
const SPEED = 50
const JUMP_VELOCITY = 4.5

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var head;
func _ready():
	head = $Head
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	pass


		

func _physics_process(delta):
	if(!pauseInstance):
		paused = false
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
		position += input_dir
		velocity.x = move_toward(velocity.x, 1, SPEED)
		velocity.z = move_toward(velocity.z, 1, SPEED)

	move_and_slide()
	
func _input(event):
	if(event.is_action_pressed("PAUSE")):
		if(!paused):
			paused = true
			get_tree().paused = true
			pauseInstance = pause_menu.instantiate();
			add_child(pauseInstance)
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		else:
			paused = false
			get_tree().paused = false
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
			pauseInstance.queue_free()
