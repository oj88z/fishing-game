class_name HoboWindUp_02_BF # BF meaning: fishing rod goes all the way BACK before turning FORWARD
extends State

# remember to add these in the inspector
@export var player: Player
@export var animator: AnimatedSprite2D

@onready var fsm = $"../../.." as FiniteStateMachine
@onready var node_cast3 = $"../../../Cast/Cast3" as HoboCast3
@onready var node_windup_03_cf = $"../WindUp_03_CF" as HoboWindUp_03_CF

signal state_entered
signal cast_pressed
signal animation_done

func _ready():
	set_process(false)
	state_entered.emit()

func _enter_state() -> void:
	set_process(true)
	animator.play("WindUp_02_BF") # if error: check node in inspector

func _exit_state() -> void:
	set_process(false)

func _process(_delta):
	if Input.is_action_just_pressed("cast"):
		cast_pressed.emit()
	else:
		await animator.animation_finished
		animation_done.emit()

func _on_state_entered(): # Loop: 2/4. Casting results in a long cast
	if (self.cast_pressed.is_connected(fsm.change_state.bind(node_cast3))):
		pass
	else:
		self.cast_pressed.connect(fsm.change_state.bind(node_cast3))
		pass
	print("windup02 ready")
	if (self.animation_done.is_connected(fsm.change_state.bind(node_windup_03_cf))):
		pass
	else:
		self.animation_done.connect(fsm.change_state.bind(node_windup_03_cf))

# from : https://docs.godotengine.org/en/stable/tutorials/2d/2d_sprite_animation.html
# If updating both an animation and a separate property at once (for example, a platformer may 
# update the sprite's h_flip/v_flip properties when a character turns while starting a 'turning' 
# animation), it's important to keep in mind that play() isn't applied instantly. Instead, it's 
# applied the next time the AnimationPlayer is processed. This may end up being on the next frame, 
# causing a 'glitch' frame, where the property change was applied but the animation was not. If 
# this turns out to be a problem, after calling play(), you can call advance(0) to update the 
# animation immediately.



