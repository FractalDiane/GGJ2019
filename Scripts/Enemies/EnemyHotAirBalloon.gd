extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
export var speed = -50

var start = false

var start_pos

func _ready():
	Controller.connect("level_reset", self, "_on_game_reset")
	start_pos = global_position

func _process(delta):
	if start:
		translate(Vector2(0,-speed*delta))

func _on_game_reset():
	global_position = start_pos
	start = false