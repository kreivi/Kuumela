extends RigidBody2D

export var min_speed = 75
export var max_speed = 125

func _on_screen_exited():
	# Destroy as soon as screen is exited (if not destroyed already)
	queue_free()


func _on_Asteroid_body_entered(body):
	$ImpactEffect.play()
	if body.has_method("impact_fx"):
		body.impact_fx(self)

