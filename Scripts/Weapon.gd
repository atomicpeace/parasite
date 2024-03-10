extends Node3D

var sword;
var animation;
var resetswing = false;
# Called when the node enters the scene tree for the first time.
func _ready():
	sword = $Sword
	animation = $'Sword/AnimationPlayer'
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _input(event):
	if(event.is_action_pressed("LEFT_CLICK")):
		resetswing = true
		animation.play("Swing")
		
			


func _on_animation_player_animation_finished(anim_name):
	if(anim_name == "Swing" && resetswing):
		resetswing = false
		animation.play_backwards(anim_name)
	pass # Replace with function body.
