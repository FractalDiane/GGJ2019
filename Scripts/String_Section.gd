extends RigidBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var time = 0

export var horizontal_force = 1
export var vertical_force = 10

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	#get_parent().sections_list.append(self)
	#add_force(global_position, Vector2(0, vertical_force))
	pass

func _process(delta):
	# Called every frame. Delta is time since last frame.
	# Update game logic here.
	time += delta
	time = fmod(time, 2 * PI)

func  _physics_process(delta):
	apply_impulse(global_position, Vector2(sin(time) * delta * horizontal_force, 0))