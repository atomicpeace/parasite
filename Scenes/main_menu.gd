extends Control

@onready var mainButtons = $MenuBox/VBoxContainer/Main
@onready var start = $MenuBox/VBoxContainer/Main/Start

@onready var options = $MenuBox/VBoxContainer/Main/Options
@onready var optionsBox = $OptionsBox
@onready var optionsApply = $OptionsBox/Options/Controls/Buttons/HBoxContainer/Apply
@onready var optionsCancel = $OptionsBox/Options/Controls/Buttons/HBoxContainer/Cancel

@onready var credits = $MenuBox/VBoxContainer/Main/Credits
@onready var creditsBox = $MenuBox/Credits
@onready var creditsOk = $MenuBox/Credits/Credits/Ok

@onready var quit = $MenuBox/VBoxContainer/Main/Quit


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
	if(optionsBox.visible && optionsCancel.button_pressed):
		optionsBox.visible = false
		mainButtons.visible = true
	if(credits.button_pressed):
		mainButtons.visible = false
		creditsBox.visible = true
	if(creditsBox.visible && creditsOk.button_pressed):
		creditsBox.visible = false
		mainButtons.visible = true
	if(quit.button_pressed):
		get_tree().quit()
	pass


func _on_rich_text_label_meta_clicked(meta):
	OS.shell_open(meta)
	pass # Replace with function body.
