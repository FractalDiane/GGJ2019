extends Node2D

export var offset = 0
export var sections = 0
export(PackedScene) var root_node
export(PackedScene) var section_node

var root_inst

var sections_list = []
#var positions = PoolVector2Array()
var curve = Curve2D.new()
func _ready():
	#spawn_nodes()
	sections_list = [
		$String_Root,
		$String_Section,
		$String_Section2,
		$String_Section3,
		$String_Section4,
		$String_Section5
	]
	for section in sections_list:
		curve.add_point(section.position)
	curve.bake_interval = 1
	root_inst = $String_Root

func _process(delta):
	#translate(Vector2(100 * delta, 0))
	update_positions()
	update()

func _draw():
	var previous_point = curve.get_point_position(0)
	for i in range(curve.get_baked_length()):
		var point = curve.interpolate_baked(i, true)
		draw_line(previous_point, point, Color(0, 0, 0), 1.0, true)
		previous_point = point
	

func update_positions():
	for i in range(len(sections_list)):
		curve.set_point_position(i, sections_list[i].position)

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
