# video link: https://www.youtube.com/watch?v=qwOM3v8T33Q&ab_channel=HeartBeast
class_name Player
extends CharacterBody2D

@onready var fsm = $FiniteStateMachine as FiniteStateMachine

# casting our states (ex: "as HoboIdle") allows us to autocomplete code from them (ex: "cast_pressed")
@onready var node_idle = $FiniteStateMachine/Idle/Idle as HoboIdle
@onready var node_windup_00 = $FiniteStateMachine/WindUp/Intro/WindUp_00 as HoboWindUp_00
@onready var node_windup_01_cb = $FiniteStateMachine/WindUp/Loop/WindUp_01_CB as HoboWindUp_01_CB
@onready var node_windup_02_bf = $FiniteStateMachine/WindUp/Loop/WindUp_02_BF as HoboWindUp_02_BF
@onready var node_windup_03_cf = $FiniteStateMachine/WindUp/Loop/WindUp_03_CF as HoboWindUp_03_CF
@onready var node_windup_04_fb = $FiniteStateMachine/WindUp/Loop/WindUp_04_FB as HoboWindUp_04_FB
@onready var node_cast1 = $FiniteStateMachine/Cast/Cast1 as HoboCast1
@onready var node_cast2 = $FiniteStateMachine/Cast/Cast2 as HoboCast2
@onready var node_cast3 = $FiniteStateMachine/Cast/Cast3 as HoboCast3
@onready var node_fishing_01 = $FiniteStateMachine/Fishing/Fishing_01 as HoboFishing_01
@onready var node_fishing_02 = $FiniteStateMachine/Fishing/Fishing_02 as HoboFishing_02
@onready var node_fishing_03 = $FiniteStateMachine/Fishing/Fishing_03 as HoboFishing_03
@onready var node_fishing_04 = $FiniteStateMachine/Fishing/Fishing_04 as HoboFishing_04
@onready var node_fishing_05 = $FiniteStateMachine/Fishing/Fishing_05 as HoboFishing_05
@onready var node_fishing_06 = $FiniteStateMachine/Fishing/Fishing_06 as HoboFishing_06
@onready var node_fishing_07 = $FiniteStateMachine/Fishing/Fishing_07 as HoboFishing_07
@onready var node_fishing_08 = $FiniteStateMachine/Fishing/Fishing_08 as HoboFishing_08
@onready var node_fishing_09 = $FiniteStateMachine/Fishing/Fishing_09 as HoboFishing_09
@onready var node_reel_01_00 = $"FiniteStateMachine/Reel/Reel_01-00" as HoboReel_01_00
@onready var node_reel_02_01 = $"FiniteStateMachine/Reel/Reel_02-01" as HoboReel_02_01
@onready var node_reel_03_02 = $"FiniteStateMachine/Reel/Reel_03-02" as HoboReel_03_02
@onready var node_reel_04_03 = $"FiniteStateMachine/Reel/Reel_04-03" as HoboReel_04_03
@onready var node_reel_05_04 = $"FiniteStateMachine/Reel/Reel_05-04" as HoboReel_05_04
@onready var node_reel_06_05 = $"FiniteStateMachine/Reel/Reel_06-05" as HoboReel_06_05
@onready var node_reel_07_06 = $"FiniteStateMachine/Reel/Reel_07-06" as HoboReel_07_06
@onready var node_reel_08_07 = $"FiniteStateMachine/Reel/Reel_08-07" as HoboReel_08_07
@onready var node_reel_09_08 = $"FiniteStateMachine/Reel/Reel_09-08" as HoboReel_09_08


func _ready():
	_process(true)
	


func _process(_delta): # here we change states via the FiniteStateMachine. 
	pass
	
	# IDLE
#	if (fsm.state == node_idle):
#		node_idle.cast_pressed.connect(fsm.change_state.bind(node_windup_00))
#		print("idle entered")

#	# WINDUP
#	if (fsm.state == node_windup_00): # WindUp intro
#		# casting during the intro results in a medium cast
#		if (fsm.state == node_windup_00 && Input.is_action_just_pressed("cast")):
#			node_windup_00.cast_pressed.connect(fsm.change_state.bind(node_cast2))
#		print("windup00 entered")
#		node_windup_00.animation_done.connect(fsm.change_state.bind(node_windup_01_cb))
	
#	if (fsm.state == node_windup_01_cb): # start of WindUp loop
#		# animation goes back through center, resulting in a medium cast
#		if (fsm.state == node_windup_01_cb && Input.is_action_just_pressed("cast")):
#			node_windup_01_cb.cast_pressed.connect(fsm.change_state.bind(node_cast2))
#		print("windup01 entered")
#		node_windup_01_cb.animation_done.connect(fsm.change_state.bind(node_windup_02_bf))
#
#	if (fsm.state == node_windup_02_bf):
#		# animation goes all the way back, then forwards, resulting in a long cast
#		if (fsm.state == node_windup_02_bf && Input.is_action_just_pressed("cast")):
#			node_windup_02_bf.cast_pressed.connect(fsm.change_state.bind(node_cast3))
#		print("windup02 entered")
#		node_windup_02_bf.animation_done.connect(fsm.change_state.bind(node_windup_03_cf))
#
#	if (fsm.state == node_windup_03_cf):
#		# animation goes forward through center, resulting in a medium cast
#		if (fsm.state == node_windup_03_cf && Input.is_action_just_pressed("cast")):
#			node_windup_03_cf.cast_pressed.connect(fsm.change_state.bind(node_cast2))
#		print("windup03 entered")
#		node_windup_03_cf.animation_done.connect(fsm.change_state.bind(node_windup_04_fb))
#
#	if (fsm.state == node_windup_04_fb): # end of WindUp loop
#		# animation goes all the way forward before turning back to start the loop over again
#		# since the character is leaning forward in this animation, the lack of momentum results in a weak cast
#		if (fsm.state == node_windup_04_fb && Input.is_action_just_pressed("cast")):
#			node_windup_04_fb.cast_pressed.connect(fsm.change_state.bind(node_cast1))
#		print("windup04 entered")
#		node_windup_04_fb.animation_done.connect(fsm.change_state.bind(node_windup_01_cb))
#
#	# CAST
#	if (fsm.state == node_cast1): # weak cast
#		await node_cast1.animation_done
#		node_cast1.animation_done.connect(fsm.change_state.bind(node_fishing_03))
#		print("cast1 entered")
#
#	if (fsm.state == node_cast2): # medium cast
#		await node_cast2.animation_done
#		node_cast2.animation_done.connect(fsm.change_state.bind(node_fishing_06))
#		print("cast2 entered")
#
#	if (fsm.state == node_cast3): # long cast
#		await node_cast3.animation_done
#		node_cast3.animation_done.connect(fsm.change_state.bind(node_fishing_09))
#		print("cast3 entered")
#
#	# FISHING
#	if (fsm.state == node_fishing_01):
#		node_fishing_01.reel_pressed.connect(fsm.change_state.bind(node_reel_01_00))
#		print("fishing_01 entered")
#
#	if (fsm.state == node_fishing_02):
#		node_fishing_02.reel_pressed.connect(fsm.change_state.bind(node_reel_02_01))
#		print("fishing_02 entered")
#
#	if (fsm.state == node_fishing_03):
#		node_fishing_03.reel_pressed.connect(fsm.change_state.bind(node_reel_03_02))
#		print("fishing_03 entered")
#
#	if (fsm.state == node_fishing_04):
#		node_fishing_04.reel_pressed.connect(fsm.change_state.bind(node_reel_04_03))
#		print("fishing_04 entered")
#
#	if (fsm.state == node_fishing_05):
#		node_fishing_05.reel_pressed.connect(fsm.change_state.bind(node_reel_05_04))
#		print("fishing_05 entered")
#
#	if (fsm.state == node_fishing_06):
#		node_fishing_06.reel_pressed.connect(fsm.change_state.bind(node_reel_06_05))
#		print("fishing_06 entered")
#
#	if (fsm.state == node_fishing_07):
#		node_fishing_07.reel_pressed.connect(fsm.change_state.bind(node_reel_07_06))
#		print("fishing_07 entered")
#
#	if (fsm.state == node_fishing_08):
#		node_fishing_08.reel_pressed.connect(fsm.change_state.bind(node_reel_08_07))
#		print("fishing_08 entered")
#
#	if (fsm.state == node_fishing_09):
#		node_fishing_09.reel_pressed.connect(fsm.change_state.bind(node_reel_09_08))
#		print("fishing_09 entered")
#
#	# REEL
#	if (fsm.state == node_reel_01_00):
#		await node_reel_01_00.animation_done
#		node_reel_01_00.animation_done.connect(fsm.change_state.bind(node_idle))
#		print("reel_01-00 entered")
#
#	if (fsm.state == node_reel_02_01):
#		await node_reel_02_01.animation_done
#		node_reel_02_01.animation_done.connect(fsm.change_state.bind(node_fishing_01))
#		print("reel_02-01 entered")
#
#	if (fsm.state == node_reel_03_02):
#		await node_reel_03_02.animation_done
#		node_reel_03_02.animation_done.connect(fsm.change_state.bind(node_fishing_02))
#		print("reel_03-02 entered")
#
#	if (fsm.state == node_reel_04_03):
#		await node_reel_04_03.animation_done
#		node_reel_04_03.animation_done.connect(fsm.change_state.bind(node_fishing_03))
#		print("reel_04-03 entered")
#
#	if (fsm.state == node_reel_05_04):
#		await node_reel_05_04.animation_done
#		node_reel_05_04.animation_done.connect(fsm.change_state.bind(node_fishing_04))
#		print("reel_05-04 entered")
#
#	if (fsm.state == node_reel_06_05):
#		await node_reel_06_05.animation_done
#		node_reel_06_05.animation_done.connect(fsm.change_state.bind(node_fishing_05))
#		print("reel_06-05 entered")
#
#	if (fsm.state == node_reel_07_06):
#		await node_reel_07_06.animation_done
#		node_reel_07_06.animation_done.connect(fsm.change_state.bind(node_fishing_06))
#		print("reel_07-06 entered")
#
#	if (fsm.state == node_reel_08_07):
#		await node_reel_08_07.animation_done
#		node_reel_08_07.animation_done.connect(fsm.change_state.bind(node_fishing_07))
#		print("reel_08-07 entered")
#
#	if (fsm.state == node_reel_09_08):
#		await node_reel_09_08.animation_done
#		node_reel_09_08.animation_done.connect(fsm.change_state.bind(node_fishing_08))
#		print("reel_09-08 entered")


