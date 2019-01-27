extends StaticBody2D

func _ready():
	$Sprite/AnimationPlayer.play("Idle")

func _on_GrabArea_body_entered(body):
	if "Player" in body.get_groups():
		Controller.get_player().mode = RigidBody2D.MODE_STATIC