class_name HoboWindUp_03_CF # CF meaning: fishing rod passes through the CENTER on it's way FORWARD
extends State

# remember to add these in the inspector
@export var player: Player
@export var animator: AnimatedSprite2D

@onready var fsm = $"../../.." as FiniteStateMachine
@onready var node_cast2 = $"../../../Cast/Cast2" as HoboCast2
@onready var node_windup_04_fb = $"../WindUp_04_FB" as HoboWindUp_04_FB

signal state_entered
signal cast_pressed
signal animation_done

func _ready():
	set_process(false)
	state_entered.emit()

func _enter_state() -> void:
	set_process(true)
	animator.play("WindUp_03_CF") # if error: check node in inspector

func _exit_state() -> void:
	set_process(false)

func _process(_delta):
	if Input.is_action_just_pressed("cast"):
		cast_pressed.emit()
	else:
		await animator.animation_finished
		animation_done.emit()

func _on_state_entered(): # Loop: 3/4. Casting results in a medium cast
	if (self.cast_pressed.is_connected(fsm.change_state.bind(node_cast2))):
		pass
	else:
		self.cast_pressed.connect(fsm.change_state.bind(node_cast2))
		pass
	print("windup03 ready")
	if (self.animation_done.is_connected(fsm.change_state.bind(node_windup_04_fb))):
		pass
	else:
		self.animation_done.connect(fsm.change_state.bind(node_windup_04_fb))

# from : https://docs.godotengine.org/en/stable/tutorials/2d/2d_sprite_animation.html
# If updating both an animation and a separate property at once (for example, a platformer may 
# update the sprite's h_flip/v_flip properties when a character turns while starting a 'turning' 
# animation), it's important to keep in mind that play() isn't applied instantly. Instead, it's 
# applied the next time the AnimationPlayer is processed. This may end up being on the next frame, 
# causing a 'glitch' frame, where the property change was applied but the animation was not. If 
# this turns out to be a problem, after calling play(), you can call advance(0) to update the 
# animation immediately.



