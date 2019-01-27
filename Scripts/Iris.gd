extends StaticBody2D

export(bool) var second_level = false

var fade = false

onready var overlay = $CanvasLayer/Overlay

func _ready():
	$Sprite/AnimationPlayer.play("Idle")

func _process(delta):
	if fade:
		overlay.modulate.a = min(overlay.modulate.a + 0.5 * delta, 1)

func _on_GrabArea_body_entered(body):
	if "Player" in body.get_groups():
		$SoundGust.play()
		fade = true
		Controller.get_player().mode = RigidBody2D.MODE_STATIC
		$TimerChangeLevel.start()

func _on_ReachArea_body_entered(body):
	if "Player" in body.get_groups():
		body.state = body.State.STATE_NEAR_GIRL
		$Sprite/AnimationPlayer.play("Reach")

func _on_TimerChangeLevel_timeout():
	if second_level:
		Controller.change_scene("res://Scenes/TitleScreen.tscn")
	else:
		Controller.change_scene("res://Scenes/Level2.tscn")

func _on_ReachArea2_body_entered(body):
	if "Player" in body.get_groups():
		$Sprite/AnimationPlayer.play("Reach")