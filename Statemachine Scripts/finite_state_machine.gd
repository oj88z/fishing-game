# video link: https://www.youtube.com/watch?v=qwOM3v8T33Q&ab_channel=HeartBeast
class_name FiniteStateMachine
extends Node

# the function of this script is to change between states! 
# our default state gets set in our ready/start function (note: we also have to drag our "state" 
# into the inspector)

@export var state: State # HoboIdle gets set in the inspector (hence @export)

signal state_changed(state) # currently not in use

func _ready():
	change_state(state)


func change_state(new_state: State):
	if state is State:
		state._exit_state() # function inherited from the state script
	new_state._enter_state() # function inherited from the state script
	state = new_state
	state_changed.emit() # currently not in use
