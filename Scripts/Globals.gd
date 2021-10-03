extends Node

# Monitors
var crypto_count = 0
var balance = 10000

var bills = 1000

var internet_cost = 250
var power_cost = 500



var mine_cost = 500
var problem_multiplier = 1 
var problem_delay = 20

# Crypto
var crypto_worth = 5000

# Stocks
var company_rating = {  
	"Desla" : 1, 
	"Pear" : 1, 
	"Mokia" : 1,
	"Macrosoft" : 1,
	"Lightswitch" : 1,
}

var stocks_qtn = {
	"Desla" : 0, 
	"Pear" : 0, 
	"Mokia" : 0,
	"Macrosoft" : 0,
	"Lightswitch" : 0,
}

var company_worth = {
	"Desla" : 1000, 
	"Pear" : 1000, 
	"Mokia" : 1000,
	"Macrosoft" : 1000,
	"Lightswitch" : 1000,
}

var seconds_lasted = 0

var event_manager
var computer
var calendar
