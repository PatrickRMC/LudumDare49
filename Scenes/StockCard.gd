extends Control

var company_worth = 0
export var company = "Macrosoft"

func _buy_stock():
	if Globals.balance >= company_worth and Globals.stocks_qtn[str(company)] < 10:
		Globals.balance -= company_worth
		Globals.stocks_qtn[str(company)] += 1

func _sell_stock():
	if Globals.stocks_qtn[company] >= 1:
		Globals.balance += Globals.company_worth[str(company)]
		Globals.stocks_qtn[company] -= 1

func _process(delta):
	company_worth = Globals.company_worth[str(company)]
	$WorthLabel.text = str("Worth: " + str(company_worth))
	$QtnLabel.text = str("Qtn: " + str(Globals.stocks_qtn[str(company)])  + "/10")
	$PopularityLabel.text = "Rating: " + str( Globals.company_rating[str(company)])
