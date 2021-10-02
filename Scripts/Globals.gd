extends Node

# Monitors
var crypto_count = 0
var balance = 10000
var bills = 1000

# Crypto
var crypto_worth = 5000

# Stocks
var company_rating = {  
	"Desla" : 5, 
	"Pear" : -5, 
	"Mokia" : 5,
	"Macrosoft" : 3,
	"Lightswitch" : 2,
}

var stocks_qtn = {
	"Desla" : 0, 
	"Pear" : 0, 
	"Mokia" : 0,
	"Macrosoft" : 0,
	"Lightswitch" : 0,
}

var company_worth = {
	"Desla" : 3000, 
	"Pear" : 3000, 
	"Mokia" : 3000,
	"Macrosoft" : 3000,
	"Lightswitch" : 3000,
}


var event_manager
