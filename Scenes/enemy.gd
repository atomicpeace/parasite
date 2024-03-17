extends Node3D

@onready var animation = $enemy_animations
@onready var killParticles = $kill
@onready var deathSound = $death_sound
var isApparition = false
# Called when the node enters the scene tree for the first time.
func _ready():
	animation.play("float")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_rigid_body_3d_body_entered(body):
	var contactName = body.get_parent().name
	var contactParent = body.get_parent()
	
	if contactName == "Sword":
		if isApparition:
			print("Wrong!")
		else: 
			print("Right!")
			deathSound.play()
			killParticles.emitting = true
	if contactName == "Torch":
		if isApparition:
			print("Right!")
			deathSound.play()
			killParticles.emitting = true
		else: 
			print("Wrong!")
	pass # Replace with function body.
