extends "res://Scripts/Enemies/EnemyAir.gd"

export(float) var delay_before_attack = 0.75

var rot_speed = 0
var target_angle = 0

func _ready():
	pass


func _process(delta):
	if rot_speed > 0:
		rot_speed = lerp(rot_speed - 0.1 * delta, 0, 0.05)
	spr.rotation += rot_speed

	if Input.is_action_just_pressed("ui_accept"):
		twirl()

func _movement(delta):
	motion.x = lerp(motion.x - (0.1 * sign(motion.x)) * delta, 0, 0.05)
	motion.y = lerp(motion.y - (0.1 * sign(motion.y)) * delta, 0, 0.05)

	move_and_collide(motion * delta)


func twirl():
	target_angle = get_angle_to(get_global_mouse_position())
	spr.set_rotation(target_angle + deg2rad(70))
	
	rot_speed = 0.5
	$TimerAttack.set_wait_time(delay_before_attack)
	$TimerAttack.start()


func attack(direction):
	motion.x = speed * cos(direction)
	motion.y = speed * sin(direction)


func _on_TimerAttack_timeout():
	#attack(get_angle_to(Controller.get_player().get_position()))
	attack(target_angle)
