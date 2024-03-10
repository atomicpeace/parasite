extends Node3D
var knight = preload("res://Scenes/knight.tscn");
var pause_menu = preload("res://Scenes/pause_menu.tscn")
var pauseInstance;
var paused = false
# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	var knightInstance = knight.instantiate();
	add_child(knightInstance)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(!pauseInstance):
		paused = false
	pass
	
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
			

