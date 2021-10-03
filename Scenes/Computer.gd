extends Sprite

func _init():
	Globals.computer = self

func _new_day():
	$SummaryPanel.visible = true
	$SummaryPanel/BBBLabel.text = "Balance:"
	$SummaryPanel/BillsLabel.text = "Bills:"
	$SummaryPanel/BABLabel.text = "New Balance:"
	
	$SummaryPanel/BBBLabelN.text = "$" + str(Globals.balance)
	$SummaryPanel/BillsLabelN.text = "$" + str(Globals.bills)
	$SummaryPanel/BABLabelN.text = "$" + str(Globals.balance - Globals.bills)

func _continue_day():
	$CalenderScreen._start_day_timer()
	Globals.balance -= Globals.bills
	Globals.bills = Globals.power_cost + Globals.internet_cost
	if Globals.balance <= 0:
		get_tree().change_scene("res://Scenes/YouLost.tscn")
	$SummaryPanel.visible = false

