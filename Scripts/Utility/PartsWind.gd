extends Particles2D

func _process(delta):
	position.x = Controller.get_player().position.x - 360
