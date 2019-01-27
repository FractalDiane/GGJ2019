extends CanvasLayer

onready var overlay = $Overlay

func _process(delta):
	overlay.modulate.a -= 1 * delta
	if overlay.modulate.a <= 0:
		queue_free()
