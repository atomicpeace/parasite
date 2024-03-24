extends Node2D

@onready var dialogBox = preload("res://Scenes/dialog.tscn")
@onready var room = get_parent()
# Called when the node enters the scene tree for the first time.

const lines : Array[Dictionary] = [
	{"text": "Hello?", "portrait": "knight"},
	{"text": "Where Am I", "portrait": "knight"},
	{"text": "YOU'RE IN HELL!!!", "portrait": "parasite"},
]

var dialog_lines: Array[Dictionary] = []
var current_line_index = 0

var text_box

var is_dialog_active = false
var can_advance_line = false

func _ready():
	start_dialog(lines)

func start_dialog(lines:Array[Dictionary]):
	if is_dialog_active:
		return
	dialog_lines = lines
	_show_text_box()
	
	is_dialog_active = true
	
func _show_text_box():
	text_box = dialogBox.instantiate()
	text_box.finished_displaying.connect(_on_text_box_finished_displaying)
	get_tree().root.add_child(text_box)
	text_box.change_portrait(dialog_lines[current_line_index].portrait)
	text_box.display_text(dialog_lines[current_line_index].text)
	can_advance_line = false

func _on_text_box_finished_displaying():
	print("finished")
	can_advance_line = true

func _process(delta):
	if Input.is_action_just_pressed("LEFT_CLICK") && is_dialog_active && can_advance_line:
		text_box.queue_free()
		
		current_line_index += 1
		if current_line_index >= dialog_lines.size():
			is_dialog_active = false
			current_line_index = 0
			return
		else:
			_show_text_box()
	
