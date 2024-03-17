extends Node2D

@onready var dialogBox = preload("res://Scenes/dialog.tscn")
@onready var room = get_parent()
# Called when the node enters the scene tree for the first time.

const lines : Array[String] = [
	"Hello?",
	"Where Am I",
	"Help!!"
]

var dialog_lines: Array[String] = []
var current_line_index = 0

var text_box
var text_box_position: Vector2

var is_dialog_active = false
var can_advance_line = false

func _ready():
	start_dialog(Vector2(get_viewport_rect().size.x/4, get_viewport_rect().size.y/4), lines)

func start_dialog(position: Vector2, lines:Array[String]):
	if is_dialog_active:
		return
	dialog_lines = lines
	text_box_position = position
	_show_text_box()
	
	is_dialog_active = true
	
func _show_text_box():
	text_box = dialogBox.instantiate()
	text_box.finished_displaying.connect(_on_text_box_finished_displaying)
	get_tree().root.add_child(text_box)
	text_box.global_position = text_box_position
	text_box.display_text(dialog_lines[current_line_index])
	can_advance_line = false

func _on_text_box_finished_displaying():
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
	
