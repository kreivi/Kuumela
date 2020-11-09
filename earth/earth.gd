extends Area2D

# Signal when earth gets hit
signal earth_hit

export (int) var speed = 3
export (float, 0, 1.0) var deacceleration = 0.25
export (float, 0, 1.0) var acceleration = 0.5

# Export the speed so it can be altered via properties
export var rotation_speed = 10
export var earth_rotation_speed = 0.727

var velocity = Vector2.ZERO

func get_input():
	var dir = 0;
	if Input.is_action_pressed("clockwise"):
		dir += 1
	if Input.is_action_pressed("counter_clockwise"):
		dir -= 1
	if dir != 0:
		velocity.x = lerp(velocity.x, dir * speed, acceleration);
	else:
		velocity.x = lerp(velocity.x, 0, deacceleration)

func _physics_process(delta):
	get_input()
	$MoonSpatial.rotate(velocity.x * delta)
	$EarthSprite.rotate(earth_rotation_speed * delta)
	
func _on_Earth_body_entered(body):
	emit_signal("earth_hit")
	body.queue_free()
	pass # Replace with function body.
