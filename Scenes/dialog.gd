extends Control

@onready var label = $Text
@onready var timer = $Timer

var text = ""
var letter_index = 0

var letter_time = 0.03
var space_time = 0.06
var punctuation_time = 0.2

signal finished_displaying()

func _ready():
	display_text("Hello World! HELP ME HELP ME AAAAHHHHHH!!!")
	
func display_text(text_to_display: String):
	text = text_to_display
	label.text = text_to_display
	
	label.text = ""
	_display_letter()
	
func _display_letter():
	label.text += text[letter_index]
	
	letter_index += 1
	if letter_index >= text.length():
		finished_displaying.emit()
		return
		
	match text[letter_index]:
		"!", ".", ",", "?":
			timer.start(punctuation_time)
		" ":
			timer.start(space_time)
		_:
			timer.start(letter_time)


func _on_timer_timeout():
	_display_letter()
	pass # Replace with function body.
	

