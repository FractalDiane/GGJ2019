extends Node2D

onready var player = $Player
onready var overlay = $Overlay

var fade = true

func _ready():
	overlay.show()
	player.linear_velocity.x = -50

func _process(delta):
	if fade:
		overlay.modulate.a = max(overlay.modulate.a - 0.5 * delta, 0)
	else:
		overlay.modulate.a = min(overlay.modulate.a + 0.5 * delta, 1)


func _on_TimerFade_timeout():
	#$SoundGust.play()
	fade = false

func _on_Timer_timeout():
	Controller.change_scene("res://Scenes/Level1.tscn")
