extends Node3D

@onready var grid = $GridMap

# Called when the node enters the scene tree for the first time.
func _ready():
	print(grid.cell_size)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
