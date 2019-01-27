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
var credits_open = false

var fade = false
var can_click = false
var buffer = false

onready var overlay = get_tree().get_root().get_node("TitleScreen").get_node("Overlay")
onready var credits = get_tree().get_root().get_node("TitleScreen").get_node("Credits")

func _ready():
	overlay.show()
	$AnimationPlayer.play("idle")

func _process(delta):
	if fade:
		overlay.modulate.a = max(overlay.modulate.a - 0.25 * delta, 0)
	else:
		overlay.modulate.a = min(overlay.modulate.a + 0.75 * delta, 1)
	
	if can_click and not credits_open:
		if over_start:
			if Input.is_action_just_pressed("ui_click"):
				start()

		if over_credits:
			if Input.is_action_just_pressed("ui_click") and not buffer:
				credits()

		if Input.is_action_just_pressed("ui_gamepad_click"):
			start()

	if credits_open and not buffer:
		if Input.is_action_just_pressed("ui_click") or Input.is_action_just_pressed("ui_gamepad_click"):
			$SoundClick.play()
			get_tree().get_root().get_node("TitleScreen").get_node("Credits").hide()
			credits_open = false


func start():
	#$SoundClick.play()
	$SoundClick.play()
	$Music/AnimMusicFade.play("fadeout")
	modulate = Color(1, 1, 1)
	$SoundGust.play()
	get_tree().get_root().get_node("TitleScreen").get_node("PartsWind").set_emitting(false)
	#fade = false
	can_click = false
	get_tree().get_root().get_node("TitleScreen").get_node("TimerWind2").start()
	#Controller.change_scene("res://Scenes/Level1.tscn")
	get_tree().get_root().get_node("TitleScreen").get_node("TimerStartGame").start()


func credits():
	$SoundClick.play()
	#Controller.change_scene("res://Scenes/Credits.tscn")
	credits.show()
	credits_open = true
	buffer = true
	get_tree().get_root().get_node("TitleScreen").get_node("TimerBuffer").start()

func _on_ClickArea_mouse_entered():
	if can_click:
		modulate = Color(1, .75, .75)
		over_start = true

func _on_ClickArea_mouse_exited():
	if can_click:
		modulate = Color(1, 1, 1)
		over_start = false


func _on_ClickAreaCredits_mouse_entered():
	if can_click:
		get_tree().get_root().get_node("TitleScreen").get_node("creditsButton").modulate = Color(1, .75, .75)
		over_credits = true


func _on_ClickAreaCredits_mouse_exited():
	if can_click:
		get_tree().get_root().get_node("TitleScreen").get_node("creditsButton").modulate = Color(1, 1, 1)
		over_credits = false 


func _on_TimerFade_timeout():
	$SoundGust.play()
	
	get_tree().get_root().get_node("TitleScreen").get_node("PartsWind").set_emitting(true)
	get_tree().get_root().get_node("TitleScreen").get_node("TimerMusic").start()
	get_tree().get_root().get_node("TitleScreen").get_node("TimerEndWind").start()


func _on_TimerMusic_timeout():
	$Music.play()
	fade = true


func _on_TimerEndWind_timeout():
	can_click = true
	#get_tree().get_root().get_node("TitleScreen").get_node("PartsWind").set_emitting(false)
	#get_tree().get_root().get_node("TitleScreen").get_node("PartsWind").get_node("PartsWind2").set_emitting(true)


func _on_TimerWind2_timeout():
	fade = false
	

func _on_TimerStartGame_timeout():
	Controller.change_scene("res://Scenes/Level1.tscn")


func _on_TimerBuffer_timeout():
	buffer = false
