extends Sprite

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var speed = 5
var moving_up = false
func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	check_moving()
	if moving_up == false:
		translate(Vector2(0, speed*delta))
	elif moving_up == true:
		translate(Vector2(0, -speed*delta))

func check_moving():
	if position.y >= 186 and position.y <= 187:
		moving_up = false
	elif position.y >= 195 and position.y <= 196:
		moving_up = true
