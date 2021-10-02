extends Sprite

var active = false
var session_crypto = 0

func _start_game():
	get_parent().find_node("StartScreen").visible = false
	active = true
	$OreSpawner._generate_world()
	$CryptoMiner.position = Vector2(-56,-24)
	session_crypto = 0

func _process(delta):
	if not active:
		return
	$CryptoLabel.text = str(session_crypto)

func _end_game():
	active = false
	get_parent().find_node("StartScreen").visible = true
	Globals.crypto_count += session_crypto
	$CryptoMiner.position = Vector2(-56,-24)
	$OreSpawner.ores = []
