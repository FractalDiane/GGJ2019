extends "res://Scripts/Enemies/EnemyGravity.gd"

onready var sprite = $Sprite

var start_pos

var prefab = preload("res://Prefabs/Enemies/EnemyTennisBall.tscn")

func _ready():
	mode = MODE_STATIC
	Controller.connect("level_reset", self, "_on_game_reset")
	start_pos = global_position

func _process(delta):
	sprite.rotation += 16*delta

func throw():
	mode = MODE_RIGID
	set_linear_velocity(Vector2(-speed,0))

func _on_game_reset():
	var new_ball = prefab.instance()
	new_ball.global_position = start_pos
	get_parent().add_child(new_ball)
	queue_free()