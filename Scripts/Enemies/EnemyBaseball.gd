extends "res://Scripts/Enemies/EnemyGravity.gd"

onready var sprite = $Sprite

onready var start_pos = global_position

func _ready():
	mode = MODE_STATIC
	Controller.connect("level_reset", self, "_on_game_reset")
	start_pos = global_position

func _process(delta):
	sprite.rotation += 8*delta

func throw():
	mode = MODE_RIGID
	set_linear_velocity(Vector2(-speed,0))

func _on_game_reset():
	global_position = start_pos