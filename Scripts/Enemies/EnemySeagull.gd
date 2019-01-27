extends "res://Scripts/Enemies/EnemyAir.gd"

export(float) var delay_before_attack = 2
export(float) var attack_cooldown = 1.5

var rot_speed = 0
var target_angle = 0
var attacking = false

var start_pos

func _ready():
	Controller.connect("level_reset", self, "_on_game_reset")
	start_pos = global_position

func _process(delta):
	if rot_speed > 0:
		rot_speed = lerp(rot_speed - 0.1 * delta, 0, 0.05)
	spr.rotation += rot_speed


func _movement(delta):
	motion.x = lerp(motion.x - (0.1 * sign(motion.x)) * delta, 0, 0.05)
	motion.y = lerp(motion.y - (0.1 * sign(motion.y)) * delta, 0, 0.05)

	move_and_collide(motion * delta)


func twirl():
	$SoundSwoop.play()
	spr.play("twirl")
	target_angle = get_angle_to(Controller.get_player().get_position())
	spr.set_rotation(target_angle + deg2rad(70))
	#if rad2deg(target_angle) > -90 and rad2deg(target_angle) < 90:
		#spr.set_flip_h(true)
		#spr.rotation += 180
	
	rot_speed = 0.5
	$TimerAttack.set_wait_time(delay_before_attack)
	$TimerAttack.start()


func attack(direction):
	$SoundAttack.play()
	spr.play("attack")
	motion.x = speed * cos(direction)
	motion.y = speed * sin(direction)
	$TimerCooldown.set_wait_time(attack_cooldown)
	$TimerCooldown.start()


func _on_AttackRadius_body_entered(body):
	if body.is_in_group("Player") and not attacking:
		twirl()
		attacking = true


func _on_TimerAttack_timeout():
	attack(target_angle)


func _on_TimerCooldown_timeout():
	spr.play("idle")
	spr.set_flip_h(false)
	rot_speed = 0
	spr.set_rotation(0)
	attacking = false

func _on_game_reset():
	global_position = start_pos
	rotation = 0
