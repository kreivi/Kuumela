extends RigidBody2D

export var min_speed = 75
export var max_speed = 125

func _on_screen_exited():
	# Destroy as soon as screen is exited (if not destroyed already)
	queue_free()
