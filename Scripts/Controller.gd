extends Node

var wr_player

func get_player():
    if wr_player == null or not wr_player.get_ref():
        set_player(get_tree().get_root().find_node("Player", true, false))
    return wr_player.get_ref()

func change_scene(to):
    get_tree().change_scene(to)

func set_player(p):
	wr_player = weakref(p)