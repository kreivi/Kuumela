extends Node

export (PackedScene) var Asteroid

func _ready():
	$AsteroidSpawner.start()
	randomize()

func spawn_asteroid():
	# Pick random point to spawn asteroid from
	$AsteroidPath/AsteroidSpawnLocation.offset = randi()
	# Instance Asteroid
	var asteroid = Asteroid.instance()
	add_child(asteroid)
	asteroid.position = $AsteroidPath/AsteroidSpawnLocation.position
	var dir = ($Earth.position - asteroid.position).normalized()
	asteroid.rotation = dir.angle()
	asteroid.linear_velocity = Vector2(rand_range(asteroid.min_speed, asteroid.max_speed), 0)
	asteroid.linear_velocity = asteroid.linear_velocity.rotated(dir.angle())


func _on_AsteroidSpawner_timeout():
	spawn_asteroid()
