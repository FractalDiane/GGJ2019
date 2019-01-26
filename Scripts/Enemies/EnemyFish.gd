extends "res://Scripts/Enemies/EnemyGravity.gd"

export(int) var jump_force = 500

func _ready():
	pass


#func _process(delta):
	

func _physics_process(delta):
	if Input.is_action_just_pressed("ui_select"):
		#leap(delta)
		set_linear_velocity(Vector2(-100, -jump_force))
		#linear_velocity.y = -100
		apply_impulse(get_global_position(), Vector2(-100, -jump_force * delta))

#func leap(delta):
	#pass
	#apply_im
