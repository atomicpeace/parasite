extends Node3D

@onready var sword = $Sword;
@onready var animation_sword = $'Sword/SwordAnim';
@onready var animation_torch = $'Torch/TorchAnim'
var resetswing = false;
var resettorch = false;
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _input(event):
	if(event.is_action_pressed("LEFT_CLICK")):
		resetswing = true
		animation_sword.play("Swing")
	if(event.is_action_pressed("RIGHT_CLICK")):
		resettorch = true
		animation_torch.play("Exorcise")
		pass
		
			


func _on_animation_player_animation_finished(anim_name):
	if(anim_name == "Swing" && resetswing):
		resetswing = false
		animation_sword.play_backwards(anim_name)
	if(anim_name == "Exorcise" && resettorch):
		resettorch = false
		animation_torch.play_backwards(anim_name)
	pass # Replace with function body.
