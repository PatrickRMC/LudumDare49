extends Control


export(Dictionary) var disasters

var disaster = ""
var cost = 0

func _process(delta):
	
	if not disaster == "":
		$TextureButton.visible = true
		$DisasterTimer.paused = true
		$StatusLabel.text = "Problem code: \n" + disaster + "\n \n Cost to fix: $" + str(disasters[disaster] * Globals.problem_multiplier)
	else:
		$StatusLabel.text = "No Problems"
		$DisasterTimer.paused = false
		$TextureButton.visible = false
			
func _on_DisasterTimer_timeout():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	$DisasterTimer.wait_time = rng.randf_range(10,Globals.problem_delay)
	
	var index = rng.randi_range(0,disasters.size()-1)
	
	match index:
		0: #Power Outage 
			disaster = "PowerOutage"
			var game = get_parent()
			game.find_node("DesktopScreen").visible = false
			game.find_node("BillsScreen").visible = false
			game.find_node("CalenderScreen").visible = false
			game.find_node("EventScreen").visible = false
			Globals.event_manager.pause = true

		1: #Monitor Broke
			disaster = "MonitorBroke"
			get_parent().find_node("DesktopScreen").visible = false
			get_parent().find_node("EventScreen").visible = false
			Globals.event_manager.pause = true
		2: #Ads
			disaster = "Ads"
			get_parent().find_node("AdsScreen").visible = true
	AudioPlay._play_audio("Shutdown")
	cost = disasters[disaster]


func _on_TextureButton_pressed():
	if Globals.balance >= cost * Globals.problem_multiplier:
		Globals.balance -= cost * Globals.problem_multiplier
		
		match disaster:
			"PowerOutage":
				AudioPlay._play_audio("Shutup")
				get_parent().find_node("DesktopScreen").visible = true
				get_parent().find_node("BillsScreen").visible = true
				get_parent().find_node("CalenderScreen").visible = true
				get_parent().find_node("EventScreen").visible = true
				Globals.event_manager.pause = false
			"MonitorBroke":
				AudioPlay._play_audio("Shutup")
				get_parent().find_node("DesktopScreen").visible = true
				get_parent().find_node("EventScreen").visible = true
				Globals.event_manager.pause = false
			"Ads":
				get_parent().find_node("AdsScreen").visible = false
				
		disaster = ""
		cost = 0
	else:
		get_tree().change_scene("res://Scenes/YouLost.tscn")
