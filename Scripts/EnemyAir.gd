extends KinematicBody2D

export(float) var speed
export(bool) var wander = true
var motion = Vector2(0, 0)
var movement

onready var spr = get_node("Sprite")


func _physics_process(delta):
	_movement(delta)


func _movement(delta):
	movement = move_and_collide(motion)