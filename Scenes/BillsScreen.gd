extends Control


func _process(delta):
	$BillsPanel/BillsLabel.text = "$" + str(Globals.bills)
