extends Node2D

onready var player = $Player

func _ready():
	player.linear_velocity.x = -50

func _process(delta):
	pass

func _on_Timer_timeout():
	Controller.change_scene("res://Scenes/Level1.tscn")
