extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
export var speed = -20

func _process(delta):
	translate(Vector2(speed*delta,0))
