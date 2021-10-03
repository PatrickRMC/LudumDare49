extends Control



func _on_PlayBtn_pressed():
	get_tree().change_scene("res://Scenes/Game.tscn")

func _on_QuitBtn_pressed():
	get_tree().quit()
