extends Control


func _process(delta):
	$BalancePanel/Money.text = "$" + str(Globals.balance)
