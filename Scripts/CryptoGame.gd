extends Sprite

var active = false
var session_crypto = 0

func _start_game():
	get_parent().find_node("StartScreen").visible = false
	active = true
	$OreSpawner.crypto_ores = []
	$OreSpawner._generate_world()
	$CryptoMiner.active = true
	$CryptoMiner.position = Vector2(-56,-24)
	session_crypto = 0

func _process(delta):
	if not active:
		get_parent().find_node("StartScreen").find_node("Label").text = "CRYPTO MINER \n \n Every tile adds $" + str(Globals.mine_cost) + " to your bills \n There are 3 crypto coins to find"
		return
	get_parent().find_node("StartScreen").find_node("Label").text = "CRYPTO MINER \n \n Every tile adds $" + str(Globals.mine_cost) + " to your bills \n There are 3 crypto coins to find"
	$CryptoLabel.text = str(session_crypto)

func _end_game():
	active = false
	get_parent().find_node("StartScreen").visible = true
	Globals.crypto_count += session_crypto
	$CryptoMiner.position = Vector2(-56,-24)
	$OreSpawner.ores = []
	$CryptoMiner.active = false
	$OreSpawner._delete_world()
	$OreSpawner.crypto_ores = []
