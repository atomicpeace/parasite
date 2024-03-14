extends Control

@onready var start = $Main/Start
@onready var options = $Main/Options
@onready var quit = $Main/Quit
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(start.button_pressed):
		get_tree().change_scene_to_file("res://Scenes/Room1.tscn")
	if(options.button_pressed):
		pass
	if(quit.button_pressed):
		get_tree().quit()
	pass
