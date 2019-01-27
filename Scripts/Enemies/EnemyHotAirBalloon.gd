extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
export var speed = -50

var start = false

func _ready():
	pass

func _process(delta):
	if start:
		translate(Vector2(0,speed*delta))
