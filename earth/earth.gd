extends KinematicBody2D

# Signal when earth gets hit
signal earth_hit

# Export the speed so it can be altered via properties
export var rotation_speed = 10

func _physics_process(delta):
	# Read movement input
	var rot = 0
	if Input.is_action_pressed("clockwise"):
		rot += 1
	if Input.is_action_pressed("counter_clockwise"):
		rot -= 1
	# Apply rotation
	$MoonSpatial.rotation += PI * rot * delta
