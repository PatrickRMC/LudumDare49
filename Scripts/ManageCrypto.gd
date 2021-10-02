extends TextureRect

func _sell_crypto():
	if Globals.crypto_count > 0:
		Globals.crypto_count -= 1
		Globals.balance += Globals.crypto_worth


func _buy_crypto():
	if Globals.balance >= Globals.crypto_worth:
		Globals.crypto_count += 1
		Globals.balance -= Globals.crypto_worth


func _process(delta):
	$CryptoWorthLabel.text = "Crypto Worth: " + str(Globals.crypto_worth)
