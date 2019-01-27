extends Particles2D

func _process(delta):
	var player = Controller.get_player()
	if player != null:
		position.x = Controller.get_player().position.x + 50
