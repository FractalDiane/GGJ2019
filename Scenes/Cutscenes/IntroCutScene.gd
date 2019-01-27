extends Node2D

onready var balloon = get_node("Position2D")
onready var moveChecker = false

func _ready():
	pass

func _process(delta):
	if moveChecker == true:
		balloon.translate(Vector2(-80*delta,-50*delta))
	

func _on_Timer_timeout():
	moveChecker = true
