extends Node

var player

func get_player():
    if player == null:
        player = get_tree().get_root().find_node("Player")
    return player

func change_scene(to):
    player = null
    get_tree().change_scene(to)
    player = find_node("Player")