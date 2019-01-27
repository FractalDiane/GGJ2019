extends Camera2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

#func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here

export var camera_offset = 160

var player_is_in = false

func _physics_process(delta):
	var player = Controller.get_player()
	if player != null:
		position.x = lerp(position.x, Controller.get_player().position.x - camera_offset, 1)
	if player_is_in:
		player.linear_velocity.y = -50


func _on_StaticBody2D_body_entered(body):
	if "Player" in body.get_groups():
		body.linear_velocity.y = 100
		body.animator.play("jump")
		body.get_node("SoundBounce").play()


func _on_CameraView_body_entered(body):
	if "HotAirBalloon" in body.get_groups():
		body.start = true
	if "Ball" in body.get_groups():
		body.throw()


func _on_StaticBody2D2_body_entered(body):
	if "Player" in body.get_groups():
		player_is_in = true
		body.linear_velocity.y = -50
		body.animator.play("jump")
		body.get_node("SoundBounce").play()


func _on_StaticBody2D2_body_exited(body):
	if "Player" in body.get_groups():
		player_is_in = false
