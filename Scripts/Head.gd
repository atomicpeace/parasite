extends Node3D

var rot_x = 0;
var rot_y = 0;
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("MOVE_LEFT"):
		rot_x += deg_to_rad(90)
		transform.basis = Basis()
		rotate_object_local(Vector3(0, 1, 0), rot_x)
	if Input.is_action_just_pressed("MOVE_RIGHT"):
		rot_x -= deg_to_rad(90)
		transform.basis = Basis()
		rotate_object_local(Vector3(0, 1, 0), rot_x)
	pass
	
func _input(event):
	var mousepos = get_viewport().get_mouse_position()
	#if event is InputEventMouseMotion:
		#rot_x -= event.relative.x * 0.005
		#rot_y -= event.relative.y * 0.005
#
		#if( rot_y >= 1.5):
			#rot_y = 1.5
		#if(rot_y <= -1.5):
			#rot_y = -1.5
		#transform.basis = Basis()
		#rotate_object_local(Vector3(0, 1, 0), rot_x)
		#rotate_object_local(Vector3(1, 0, 0), rot_y)
