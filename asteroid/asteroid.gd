extends RigidBody2D

export var min_speed = 50
export var max_speed = 125

func _on_screen_exited():
	# Destroy as soon as screen is exited (if not destroyed already)
	queue_free()


func _on_Asteroid_body_entered(body):
	if (body.is_in_group("asteroids")):
		# Destroy when colliding with another asteroid
		queue_free()
	pass # Replace with function body.
