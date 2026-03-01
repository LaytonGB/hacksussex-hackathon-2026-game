extends Area3D

const ROT_SPEED = 2 #number of degrees the coin rotates every framee

#size of the spawn area
@export var area_width: float = 20.0
@export var area_depth: float = 20.0
@export var min_height: float = 0.5
@export var max_height: float = 0.5


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize() #ensures random positions 
	position = Vector3(
		randf_range(-area_width/2, area_width/2),
		randf_range(min_height, max_height),
		randf_range(area_depth/2, area_depth/2)		
	)
	
func _process(delta):
	rotate_y(deg_to_rad(ROT_SPEED))

func _on_body_entered(body):
	queue_free() 
