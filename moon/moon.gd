extends KinematicBody2D

export var moon_rotation_speed = 0.364

func _process(delta):
	$MoonSprite.rotate(moon_rotation_speed * delta)
