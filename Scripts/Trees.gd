extends StaticBody2D

const trees = preload("res://Prefabs/Trees.tscn")

func _ready():
	for i in range(10):
		var trees_i = trees.instance()
		trees_i.set_position(Vector2(360 * i,0))
		get_tree().get_root().add_child(trees_i)

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
