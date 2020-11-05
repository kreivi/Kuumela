extends Area2D

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


func _on_Earth_body_entered(body):
	emit_signal("earth_hit")
	body.queue_free()
	pass # Replace with function body.
