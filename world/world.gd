extends Node

export (PackedScene) var Asteroid

signal deduct_life

var difficulty_factor = 1

var scatter = Vector2.ZERO

func _ready():
	randomize()
	
func new_game():
	$Earth.visible = true
	$AsteroidSpawner.start()
	calc_difficulty()

func game_over():
	get_tree().call_group('asteroids', 'queue_free')
	$AsteroidSpawner.stop()
	$Earth.visible = false
	difficulty_factor = 1

func calc_difficulty():
	var size = $Earth/EarthSprite.texture.get_size()
	scatter = size * (1 / difficulty_factor) * 1.25
	var newWait = 1 - (difficulty_factor * 0.1)
	$AsteroidSpawner.wait_time = max(newWait, 0.05)
	

func spawn_asteroid():
	# Pick random point to spawn asteroid from
	$AsteroidPath/AsteroidSpawnLocation.offset = randi()
	# Instance Asteroid
	var asteroid = Asteroid.instance()
	add_child(asteroid)
	asteroid.position = $AsteroidPath/AsteroidSpawnLocation.position
	var scatterPos = Vector2(rand_range(scatter.x, -scatter.x), rand_range(scatter.y, -scatter.y))
	var dir = (($Earth.position + scatterPos)  - asteroid.position).normalized()
	asteroid.rotation = dir.angle()
	asteroid.linear_velocity = Vector2(rand_range(asteroid.min_speed, asteroid.max_speed), 0)
	asteroid.linear_velocity = asteroid.linear_velocity.rotated(dir.angle())

func _on_AsteroidSpawner_timeout():
	spawn_asteroid()

func _on_Earth_hit():
	emit_signal("deduct_life")

func rampup_difficulty():
	difficulty_factor += 1
	calc_difficulty()
