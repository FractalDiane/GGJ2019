extends Particles2D

export(bool) var follow_player = true

func _process(delta):
	var player = Controller.get_player()
	if follow_player and player != null:
		position.x = Controller.get_player().position.x - 360
