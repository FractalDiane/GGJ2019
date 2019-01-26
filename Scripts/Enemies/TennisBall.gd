extends "res://Scripts/Enemies/EnemyGravity.gd"

onready var sprite = $Sprite

func _ready():
	set_linear_velocity(Vector2(-speed,0))

func _process(delta):
	sprite.rotation += 16*delta