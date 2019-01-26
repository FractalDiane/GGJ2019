extends Node2D

export var offset = 0
export var sections = 0
export(PackedScene) var root_node
export(PackedScene) var section_node

var sections_list = []
var positions = PoolVector2Array()
func _ready():
	#spawn_nodes()
	pass
	sections_list = [
		$String_Root,
		$String_Section,
		$String_Section2,
		$String_Section3,
		$String_Section4,
		$String_Section5
	]

func _process(delta):
	#translate(Vector2(100 * delta, 0))
	update_positions()
	update()

func _draw():
	draw_multiline(positions, Color(0, 0, 0))

func update_positions():
	positions = PoolVector2Array()
	positions.append(sections_list[0].position)
	for i in range(1, len(sections_list)):
		positions.append(sections_list[i].position)
		positions.append(sections_list[i].position)
	positions.remove(len(positions) - 1)

func spawn_nodes():
	var total_offset = 0
	var root = root_node.instance()
	add_child(root)
	sections_list.append(root)
	var previous_section = root
	for i in range(sections):
		total_offset += offset
		var section = section_node.instance()
		add_child(section)
		sections_list.append(section)
		section.position.y = total_offset
		var pin = PinJoint2D.new()
		previous_section.add_child(pin)
		pin.position = Vector2(0, 0)
		pin.node_a = '../'
		pin.node_b = pin.get_path_to(section)
		previous_section = section
