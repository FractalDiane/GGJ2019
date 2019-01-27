extends Node

var wr_player
var player_prefab = preload("res://Prefabs/Player/Player.tscn")

signal level_reset

func get_player():
	if wr_player != null:
		return wr_player.get_ref()

func change_scene(to):
	get_tree().change_scene(to)

func set_player(p):
	if p != null:
		wr_player = weakref(p)
		p.connect("on_player_death", self, "_on_player_death")

func _on_player_death():
	pass

func reset():
	var player = get_player()
	if player != null:
		get_player().queue_free()
		var new_player = player_prefab.instance()
		new_player.set_global_position(Vector2(640 / 2, 360 / 2))
		for node in get_tree().get_root().get_children():
			if node is Node2D:
				node.add_child(new_player)
	emit_signal("level_reset")