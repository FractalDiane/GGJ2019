extends "res://Scripts/Enemies/EnemyAir.gd"

export(int) var radius = 20
export(int) var petal_constant = 2

var start_x
var start_y

var angle = 0

func _ready():
	angle = round(rand_range(0, 359))
	start_x = get_position().x
	start_y = get_position().y

func _movement(delta):
	angle += speed * delta
	var rad = radius * cos(petal_constant * angle)
	position.x = start_x + (rad * cos(angle))
	position.y = start_y + (rad * sin(angle))
