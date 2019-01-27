extends Particles2D

export(bool) var follow_player = true

func _process(delta):
	if follow_player:
		position.x = Controller.get_player().position.x - 360
