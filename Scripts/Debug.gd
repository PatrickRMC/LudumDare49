extends Control



func _process(delta):
	$Debug/CryptoLabel.text = "GLOBALS.crypto_count = " + str(Globals.crypto_count)
	$Debug/BalanceLabel.text = "GLOBALS.balance = " + str(Globals.balance)
	$Debug/BillsLabel.text = "GLOBALS.bills = " + str(Globals.bills)


func _on_NewEventButton_pressed():
	Globals.event_manager._new_event()
