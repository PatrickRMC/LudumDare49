extends Control



func _process(delta):
	
	if Input.is_action_just_pressed("toggle_debug"):
		visible = not visible
	
	$Debug/CryptoLabel.text = "GLOBALS.crypto_count = " + str(Globals.crypto_count)
	$Debug/BalanceLabel.text = "GLOBALS.balance = " + str(Globals.balance)
	$Debug/BillsLabel.text = "GLOBALS.bills = " + str(Globals.bills)
	
	Globals.calendar.pausedEvent = $Debug/EventTimer.pressed
	Globals.calendar.pausedDay = $Debug/DayTimer.pressed

func _on_NewEventButton_pressed():
	Globals.event_manager._new_event()

func _on_NewDayButton_pressed():
	Globals.computer._new_day()
