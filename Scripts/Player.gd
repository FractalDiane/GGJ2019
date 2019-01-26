extends RigidBody2D

# Constants
const JUMP_BUTTON = "player_jump"
enum State {STATE_NO_INPUT, STATE_IN_GAME}


# Exports
export var jump_force = 100
export(State) var state = State.STATE_IN_GAME

# Overrides
func _ready():
	pass

func _process(delta):
	match state:
		State.STATE_IN_GAME:
			poll_for_input()

# Functions
func jump():
	apply_impulse(global_position, Vector2(0, jump_force))

func poll_for_input():
	if Input.is_action_just_pressed(JUMP_BUTTON):
		jump()
