extends CharacterBody3D

var pause_menu = preload("res://Scenes/pause_menu.tscn")
var pauseInstance;
var paused = false
const SPEED = 5

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
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("MOVE_LEFT", "MOVE_RIGHT", "MOVE_FORWARD", "MOVE_BACK")
	var direction = (head.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

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
