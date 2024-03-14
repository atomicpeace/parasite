extends Node3D

@onready var animation = $enemy_animations
var isAparition = false
# Called when the node enters the scene tree for the first time.
func _ready():
	animation.play("float")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
