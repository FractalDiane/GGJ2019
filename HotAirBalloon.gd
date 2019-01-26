extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
export var speed = -50

func _ready():
	pass

func _process(delta):
	translate(Vector2(0,speed*delta))
