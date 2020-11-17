extends Node

var score = 0
var lives = 3

func _ready():
	game_over()
	
func new_game():
	lives = 3
	score = 0
	$World.new_game()
	$GUI.new_game()
	$ScoreTimer.start()

func game_over():
	$World.game_over()
	$GUI.game_over()
	$ScoreTimer.stop()

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		get_tree().quit()


func _on_ScoreTimer_timeout():
	score += 1
	$GUI.set_score(score)
	if (score % 3 == 0):
		$World.rampup_difficulty()
	if (score % 7 == 0):
		grant_life()

func set_lives(newLives):
	if (newLives <= 3 && newLives != lives):
		lives = newLives
		$GUI.set_lives(lives)
	
func grant_life():
	if (lives < 3):
		set_lives(lives + 1)
		
func _on_World_deduct_life():
	set_lives(lives - 1)
	if lives <= 0:
		game_over()



func _on_GUI_request_new():
	new_game()
