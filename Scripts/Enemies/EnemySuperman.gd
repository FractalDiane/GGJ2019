extends KinematicBody2D

export var x_speed = 40
export var y_speed = 20
var moving_up = false

var t = 0
var y_start

func _ready():
	y_start = get_position().y

func _process(delta):
	t += 3 * delta

	position.y = y_start + sin(t) * 42
# 	#check_moving()
# 	if moving_up == false:
# 		translate(Vector2(-x_speed*delta, y_speed*delta))
# 	elif moving_up == true:
# 		translate(Vector2(-x_speed*delta, -y_speed*delta))

# func check_moving():
# 	if position.y >= 100 and position.y <= 101:
# 		moving_up = false
# 	elif position.y >= 120 and position.y <= 121:
# 		moving_up = true