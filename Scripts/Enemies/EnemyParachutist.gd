extends "res://Scripts/Enemies/EnemyAir.gd"

export(bool) var horizontal = false
export(float) var amplitude = 10

var t = 0
var start_x
var start_y

func _ready():
	start_x = get_position().x
	start_y = get_position().y

func _process(delta):
	t += 10 * delta * speed

func _movement(delta):
	if horizontal:
		position.x = start_x + (sin(t) * amplitude)
	else:
		position.y = start_y + (sin(t) * amplitude)
