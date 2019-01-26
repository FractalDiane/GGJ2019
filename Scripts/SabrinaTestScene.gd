extends KinematicBody2D

export var x_speed = 40
export var y_speed = 20
var moving_up = false

func _ready():
	pass

func _process(delta):
	print(position.y)
	check_moving()
	if moving_up == false:
		translate(Vector2(-x_speed*delta, y_speed*delta))
	elif moving_up == true:
		translate(Vector2(-x_speed*delta, -y_speed*delta))

func check_moving():
	print(moving_up)
	if position.y >= 100 and position.y <= 101:
		moving_up = false
	elif position.y >= 120 and position.y <= 121:
		moving_up = true