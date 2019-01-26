extends ColorRect

func _ready():
	pass

func _process(delta):
	modulate.h += 0.5 * delta
