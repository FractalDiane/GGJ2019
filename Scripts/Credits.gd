extends Node2D

func _ready():
	$SoundBack.play()

func _process(delta):
	if Input.is_action_just_pressed("ui_click") or Input.is_action_just_pressed("ui_gamepad_click"):
		Controller.change_scene("res://Scenes/TitleScreen.tscn")
