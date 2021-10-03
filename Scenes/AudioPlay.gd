extends Node

func _ready():
	$Music.play()

func _play_audio(x):
	find_node(x).play()

func _process(delta):
	if Input.is_action_just_pressed("click"):
		_play_audio("Click")
