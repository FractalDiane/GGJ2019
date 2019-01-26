extends Camera2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

#func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here

func _process(delta):
	position.x = Controller.get_player().position.x
