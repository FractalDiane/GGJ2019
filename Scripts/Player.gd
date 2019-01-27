extends RigidBody2D

# Constants
const JUMP_BUTTON = "player_jump"
enum State {STATE_NO_INPUT, STATE_IN_GAME, STATE_DEAD}
enum Expression {EXPRESSION_NEUTRAL, EXPRESSION_SCARED, EXPRESSION_OUCH}

# Exports
export var jump_force = 100
export var right_move_speed = 100
export var right_move_force = 100
export(State) var state = State.STATE_IN_GAME

# Variables
var expression = Expression.EXPRESSION_NEUTRAL

onready var sprite = $Sprite
onready var collider = $CollisionShape2D
onready var string_root = $Node2D/String_Root 
onready var animator = sprite.get_node("AnimationPlayer")
onready var area_danger = $AreaDanger

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
	print(body.get_groups())
	if "Enemy" in body.get_groups():
		die()

func _on_AreaDanger_body_entered(body):
	if "Enemy" in body.get_groups():
		expression = Expression.EXPRESSION_SCARED


# Functions
func jump():
	if expression == Expression.EXPRESSION_NEUTRAL:
		animator.play("jump")
	elif expression == Expression.EXPRESSION_SCARED:
		animator.play("scared_jump")
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
	$SoundPop.play()
	state = State.STATE_DEAD
	emit_signal("on_player_death")

	$PartsPop.set_emitting(true)
	mode = MODE_STATIC
	sprite.visible = false
	collider.disabled = true
	string_root.mode = MODE_RIGID
	string_root.gravity_scale = 1

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == 'jump' or anim_name == 'scared_jump':
		if expression == Expression.EXPRESSION_NEUTRAL:
			animator.play("idle")
		elif expression == Expression.EXPRESSION_SCARED:
			animator.play("scared_idle")


func _on_AreaDanger_body_exited(body):
	if "Enemy" in body.get_groups():
		expression = Expression.EXPRESSION_NEUTRAL
