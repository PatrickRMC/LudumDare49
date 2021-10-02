extends Control

var company_worth = 0
export var company = "Macrosoft"

func _ready():
	print(company)
	company_worth = Globals.company_worth[str(company)]

func _buy_stock():
	if Globals.balance >= company_worth:
		Globals.balance -= company_worth
		Globals.stocks_qtn[str(company)] += 1

func _sell_stock():
	if Globals.stocks_qtn[company] >= 1:
		Globals.balance += Globals.company_worth[str(company)]
		Globals.stocks_qtn[company] -= 1
		

func _process(delta):
	$WorthLabel.text = str("Worth: " + str(company_worth))
	$QtnLabel.text = str("Qtn: " + str(Globals.stocks_qtn[str(company)]))
	$PopularityLabel.text = str(Globals.company_rating[str(company)])
