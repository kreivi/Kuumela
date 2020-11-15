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
	if (score % 2 == 0):
		$World.rampup_difficulty()


func _on_World_deduct_life():
	lives -= 1
	if lives > 0:
		$GUI.set_lives(lives)
	if lives <= 0:
		game_over()



func _on_GUI_request_new():
	new_game()
