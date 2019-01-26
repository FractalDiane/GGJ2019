extends Node2D

export var offset = 0
export var sections = 0
export(PackedScene) var root_node
export(PackedScene) var section_node

var sections_list = []

func _ready():
	spawn_nodes()

func _process(delta):
	pass

func spawn_nodes():
	total_offset = 0
	root = root_node.instance()
	add_child(root)
	sections_list.append(root)
	var previous_section = root
	for i in range(sections):
		total_offset += offset
		var section = section_node.instance()
		add_child(section)
		sections_list.append(section)
		section.position.y = total_offset
		previous_section.get_node("PinJoint2D").node_b = previous_section.get_node("PinJoint2D").get_path_to(section)
		previous_section = section
