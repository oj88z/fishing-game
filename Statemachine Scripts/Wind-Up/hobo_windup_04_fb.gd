class_name HoboWindUp_04_FB # FB meaning: fishing rod goes all the way FORWARD before turning BACK
extends State
# to solve the duplicating script error after renaming classes, simply open the script
# and give it some time to update the names

# the function of this script is to handle the movement, specific state animations as well as 
# signaling a change of states when exiting

# remember to add these in the inspector
@export var player: Player # the main node that our state manipulates / CharacterBody2D
@export var animator: AnimatedSprite2D

@onready var fsm = $"../../.." as FiniteStateMachine
@onready var node_cast1 = $"../../../Cast/Cast1" as HoboCast1
@onready var node_windup_01_cb = $"../WindUp_01_CB" as HoboWindUp_01_CB

signal state_entered
signal cast_pressed
signal animation_done

func _ready():
	set_process(false)
	state_entered.emit()

func _enter_state() -> void:
	set_process(true)
	animator.play("WindUp_04_FB") # if error: check node in inspector

func _exit_state() -> void:
	set_process(false)

func _process(_delta):
	if Input.is_action_just_pressed("cast"):
		cast_pressed.emit()
	else:
		await animator.animation_finished
		animation_done.emit()

func _on_state_entered(): # Loop: 4/4. Casting results in a weak cast
	if (self.cast_pressed.is_connected(fsm.change_state.bind(node_cast1))):
		pass
	else:
		self.cast_pressed.connect(fsm.change_state.bind(node_cast1))
		pass
	print("windup04 ready")
	if (self.animation_done.is_connected(fsm.change_state.bind(node_windup_01_cb))):
		pass
	else:
		self.animation_done.connect(fsm.change_state.bind(node_windup_01_cb))

# from : https://docs.godotengine.org/en/stable/tutorials/2d/2d_sprite_animation.html
# If updating both an animation and a separate property at once (for example, a platformer may 
# update the sprite's h_flip/v_flip properties when a character turns while starting a 'turning' 
# animation), it's important to keep in mind that play() isn't applied instantly. Instead, it's 
# applied the next time the AnimationPlayer is processed. This may end up being on the next frame, 
# causing a 'glitch' frame, where the property change was applied but the animation was not. If 
# this turns out to be a problem, after calling play(), you can call advance(0) to update the 
# animation immediately.



