extends Node2D

var speed = 100

func _ready():
	pass

func _process(delta):
	pass
	
func _physics_process(delta):
	translate(Vector2(speed*delta,0))