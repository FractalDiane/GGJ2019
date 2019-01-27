extends Node

func _process(delta):
	if Input.is_action_just_pressed("restart_room"):
		get_tree().reload_current_scene()