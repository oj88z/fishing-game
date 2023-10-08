class_name HoboCast1
extends State

# remember to add these in the inspector
@export var player: Player
@export var animator: AnimatedSprite2D

@onready var fsm = $"../.." as FiniteStateMachine
@onready var node_fishing_03 = $"../../Fishing/Fishing_03" as HoboFishing_03

signal state_entered
signal animation_done

func _ready():
	set_process(false)
	state_entered.emit()

func _enter_state() -> void:
	set_process(true)
	animator.play("Cast1") # if error: check node in inspector

func _exit_state() -> void:
	set_process(false)

func _process(_delta):
		await animator.animation_finished
		animation_done.emit()

func _on_state_entered(): # weak cast
	if (animation_done.is_connected(fsm.change_state.bind(node_fishing_03))):
		pass
	else:
		animation_done.connect(fsm.change_state.bind(node_fishing_03))
	print("cast1 ready")

# from : https://docs.godotengine.org/en/stable/tutorials/2d/2d_sprite_animation.html
# If updating both an animation and a separate property at once (for example, a platformer may 
# update the sprite's h_flip/v_flip properties when a character turns while starting a 'turning' 
# animation), it's important to keep in mind that play() isn't applied instantly. Instead, it's 
# applied the next time the AnimationPlayer is processed. This may end up being on the next frame, 
# causing a 'glitch' frame, where the property change was applied but the animation was not. If 
# this turns out to be a problem, after calling play(), you can call advance(0) to update the 
# animation immediately.


