extends RigidBody2D

# Constants
const JUMP_BUTTON = "player_jump"
enum State {STATE_NO_INPUT, STATE_IN_GAME, STATE_DEAD}

# Exports
export var jump_force = 100
export var right_move_speed = 100
export var right_move_force = 100
export(State) var state = State.STATE_IN_GAME

# Variables
onready var sprite = $Sprite
onready var collider = $CollisionShape2D
onready var string_root = $Node2D/String_Root 
onready var animator = sprite.get_node("AnimationPlayer")

# Signals
signal on_player_death

# Overrides
func _ready():
	animator.play("idle")

func _process(delta):
	match state:
		State.STATE_IN_GAME:
			poll_for_input()

func _physics_process(delta):
	match state:
		State.STATE_IN_GAME:
			move_right(delta)

func _on_Player_body_entered(body):
	if "Enemy" in body.get_groups():
		die()

# Functions
func jump():
	animator.play("jump")
	if linear_velocity.y < 0:
		linear_velocity.y = jump_force
	else:
		apply_impulse(global_position, Vector2(0, jump_force))

func move_right(delta):
	if linear_velocity.x <= right_move_speed:
		apply_impulse(global_position, Vector2(right_move_force * delta, 0))

func poll_for_input():
	if Input.is_action_just_pressed(JUMP_BUTTON):
		jump()

func die():
	state = State.STATE_DEAD
	emit_signal("on_player_death")

	sprite.visible = false
	collider.disabled = true
	string_root.mode = MODE_RIGID
	string_root.gravity_scale = 1