extends Sprite

# # class member variables go here, for example:
# # var a = 2
# # var b = "textvar"
# var speed = 5
# var moving_up = false
# func _ready():
# 	# Called when the node is added to the scene for the first time.
# 	# Initialization here
# 	pass

# func _process(delta):
# 	check_moving()
# 	if moving_up == false:
# 		translate(Vector2(0, speed*delta))
# 	elif moving_up == true:
# 		translate(Vector2(0, -speed*delta))

# func check_moving():
# 	if position.y >= 186 and position.y <= 187:
# 		moving_up = false
# 	elif position.y >= 195 and position.y <= 196:
# 		moving_up = true

var over_start = false
var over_credits = false

var fade = false
var can_click = false

onready var overlay = get_tree().get_root().get_node("Overlay")

func _ready():
	$AnimationPlayer.play("idle")

func _process(delta):
	if over_start:
		if Input.is_action_just_pressed("ui_click"):
			start()

	if over_credits:
		if Input.is_action_just_pressed("ui_click"):
			credits()

	if Input.is_action_just_pressed("ui_gamepad_click"):
		start()


func start():
	#$SoundClick.play()
	Controller.change_scene("res://Scenes/Level1.tscn")


func credits():
	#$SoundClick.play()
	Controller.change_scene("res://Scenes/Credits.tscn")

func _on_ClickArea_mouse_entered():
	modulate = Color(1, .75, .75)
	over_start = true

func _on_ClickArea_mouse_exited():
	modulate = Color(1, 1, 1)
	over_start = false


func _on_ClickAreaCredits_mouse_entered():
	over_credits = true


func _on_ClickAreaCredits_mouse_exited():
	over_credits = false 


func _on_TimerFade_timeout():
	$SoundGust.play()
	fade = true
	get_tree().get_root().get_node("PartsWind").set_emitting(true)
	$TimerMusic.start()


func _on_TimerMusic_timeout():
	$Music.play()


func _on_TimerEndWind_timeout():
	get_tree().get_root().get_node("PartsWind").set_emitting(false)
