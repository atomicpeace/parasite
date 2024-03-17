extends Node3D

@onready var sword = $Sword;
@onready var animation_sword = $'Sword/SwordAnim';
@onready var animation_torch = $'Torch/TorchAnim'
@onready var collision_torch = $'Torch/Torch/StaticBody3D/CollisionShape3D'
@onready var collision_sword = $'Sword/StaticBody3D/CollisionShape3D'
var resetswing = false;
var resettorch = false;
# Called when the node enters the scene tree for the first time.
func _ready():
	collision_torch.disabled = true
	collision_sword.disabled = true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _input(event):
	if(event.is_action_pressed("LEFT_CLICK")):
		collision_sword.disabled = false
		resetswing = true
		animation_sword.play("Swing")
	if(event.is_action_pressed("RIGHT_CLICK")):
		collision_torch.disabled = false
		resettorch = true
		animation_torch.play("Exorcise")
		pass
		
			


func _on_animation_player_animation_finished(anim_name):
	if(anim_name == "Swing" && resetswing):
		resetswing = false
		animation_sword.play_backwards(anim_name)
		collision_sword.disabled = true
	if(anim_name == "Exorcise" && resettorch):
		resettorch = false
		animation_torch.play_backwards(anim_name)
		collision_torch.disabled = true
	pass # Replace with function body.
