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


func _on_Timer_timeout():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	Globals.crypto_worth = stepify(rand_range(1000, 10000), 0.5)
