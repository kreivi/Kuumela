extends Node

var score = 0

func _ready():
	new_game()
	
func new_game():
	score = 0
	$ScoreTimer.start()

func game_over():
	$ScoreTimer.stop()

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		get_tree().quit()


func _on_ScoreTimer_timeout():
	score += 1
	$GUI.set_score(score)
