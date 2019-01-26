extends Node

func _process(delta):
	if Input.is_action_just_pressed("restart_room"):
		print("test")
		Controller.player = null
		get_tree().reload_current_scene()