extends "res://Scripts/Enemies/EnemyGravity.gd"

onready var sprite = $Sprite

func _ready():
	mode = MODE_STATIC

func _process(delta):
	sprite.rotation += 8*delta

func throw():
	mode = MODE_RIGID
	set_linear_velocity(Vector2(-speed,0))
