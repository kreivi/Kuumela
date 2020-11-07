extends Node

func new_game():
	pass

func game_over():
	pass

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		get_tree().quit()
