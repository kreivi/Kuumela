extends RigidBody2D

export var min_speed = 100
export var max_speed = 250

func _ready():	
	pass # Replace with function body.

func _on_screen_exited():
	# Destroy as soon as screen is exited (if not destroyed already)
	queue_free()
