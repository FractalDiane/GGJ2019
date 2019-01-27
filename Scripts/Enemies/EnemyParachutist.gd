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
	translate(Vector2(-30*delta,100*delta))
	t += delta
	if t > 5:
		queue_free()
#	t += 10 * delta * speed

func _movement(delta):
	pass
#	if horizontal:
#		position.x = start_x + (sin(t) * amplitude)
#	else:
#		position.y = start_y + (sin(t) * amplitude)