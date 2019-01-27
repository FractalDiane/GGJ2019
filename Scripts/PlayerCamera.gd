extends Camera2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

#func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here

func _physics_process(delta):
	position.x = Controller.get_player().position.x - 320


func _on_StaticBody2D_body_entered(body):
	if "Player" in body.get_groups():
		body.linear_velocity.y = 100
		body.animator.play("jump")
		body.get_node("SoundBounce").play()


func _on_CameraView_body_entered(body):
	if "HotAirBalloon" in body.get_groups():
		body.start = true
