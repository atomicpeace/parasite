extends Control

@onready var mainButtons = $MarginContainer/VBoxContainer/Main
@onready var start = $MarginContainer/VBoxContainer/Main/Start
@onready var options = $MarginContainer/VBoxContainer/Main/Options
@onready var quit = $MarginContainer/VBoxContainer/Main/Quit
@onready var credits = $MarginContainer/VBoxContainer/Main/Credits
@onready var creditsBox = $MarginContainer/Credits
@onready var optionsBox = $MarginContainer/Options
# Called when the node enters the scene tree for the first time.
func _ready():
	optionsBox.visible = false
	creditsBox.visible = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(start.button_pressed):
		get_tree().change_scene_to_file("res://Scenes/Room1.tscn")
	if(options.button_pressed):
		mainButtons.visible = false
		optionsBox.visible = true
	if(credits.button_pressed):
		mainButtons.visible = false
		creditsBox.visible = true
	if(quit.button_pressed):
		get_tree().quit()
	pass
