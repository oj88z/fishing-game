class_name HoboFishing_01
extends State

# remember to add these in the inspector
@export var player: Player
@export var animator: AnimatedSprite2D

@onready var fsm = $"../.." as FiniteStateMachine
@onready var node_reel_01_00 = $"../../Reel/Reel_01-00" as HoboReel_01_00

signal state_entered
signal reel_pressed # when SHIFT is pressed we signal for a change of states
signal bite3

func _ready():
	set_process(false)
	state_entered.emit()

func _enter_state() -> void:
	set_process(true)
	animator.play("Fishing_01") # if error: check node in inspector

func _exit_state() -> void:
	set_process(false)

func _process(_delta):
	if Input.is_action_pressed("reel"):
		reel_pressed.emit()

func _on_state_entered():
	if (reel_pressed.is_connected(fsm.change_state.bind(node_reel_01_00))):
		pass
	else:
		reel_pressed.connect(fsm.change_state.bind(node_reel_01_00))
	print("fishing_01 ready")

# from : https://docs.godotengine.org/en/stable/tutorials/2d/2d_sprite_animation.html
# If updating both an animation and a separate property at once (for example, a platformer may 
# update the sprite's h_flip/v_flip properties when a character turns while starting a 'turning' 
# animation), it's important to keep in mind that play() isn't applied instantly. Instead, it's 
# applied the next time the AnimationPlayer is processed. This may end up being on the next frame, 
# causing a 'glitch' frame, where the property change was applied but the animation was not. If 
# this turns out to be a problem, after calling play(), you can call advance(0) to update the 
# animation immediately.

