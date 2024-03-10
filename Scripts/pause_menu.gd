extends Control

var resume;
var quit;
var box;
# Called when the node enters the scene tree for the first time.
func _ready():
	process_mode = Node.PROCESS_MODE_ALWAYS
	resume = $CenterContainer/VBoxContainer/Resume
	quit = $CenterContainer/VBoxContainer/Quit
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(resume.button_pressed):
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		get_tree().paused = false
		self.queue_free()
	if(quit.button_pressed):
		get_tree().quit()
	pass
