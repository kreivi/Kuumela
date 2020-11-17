extends Control

signal request_new
signal toggle_music

func _ready():
	$MainMenu/Menu/Scorewrapper.visible = false
	
func new_game():
	$MainMenu/Menu/Scorewrapper.visible = true
	set_score(0)
	$MainMenu.hide()
	$Game.show()
	set_lives(3)

func game_over():
	$Game.hide()
	$MainMenu.show()
	set_lives(0)
	
func set_score(newscore):
	$MainMenu/Menu/Scorewrapper/Score.text = str(newscore)
	$Game/BottomPanel/ScoreContainer/Score.text = str(newscore)

func set_life_visibilities(one, two, three):
	$Game/BottomPanel/LivesContainer/Lives/Life1.visible = one
	$Game/BottomPanel/LivesContainer/Lives/Life2.visible = two
	$Game/BottomPanel/LivesContainer/Lives/Life3.visible = three
		
func set_lives(newLives):
	# TODO: Ugly code blaargh í ¾í´®í ¾
	if newLives == 3:
		set_life_visibilities(true, true, true)
	elif newLives == 2:
		set_life_visibilities(false, true, true)
	elif newLives == 1:
		set_life_visibilities(false, false, true)
	else:
		set_life_visibilities(false, false, false)


func _on_NewGame_pressed():
	emit_signal('request_new')


func _on_Music_toggled(button_pressed):
	emit_signal("toggle_music", button_pressed)

