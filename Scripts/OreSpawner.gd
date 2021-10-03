extends Node2D

var ore_scene = preload("res://Scenes/CryptoOre.tscn")
export(Texture) var cryptotext
var h_range = 8
var v_range = 5

var amount_of_crypto = 2
var ores = []
var crypto_ores = []
var is_active = false

func _generate_world():
	var x_offset = 0
	var y_offset = 0
	for i in h_range:
		for j in v_range:
			var ore = ore_scene.instance()
			add_child(ore)
			ore.global_position = global_position + Vector2(x_offset,y_offset)
			y_offset += 16
			ores.append(ore)
		x_offset += 16
		y_offset = 0
	
	for i in amount_of_crypto:
		var rng = RandomNumberGenerator.new()
		rng.randomize()
		var x = rng.randi_range(0,ores.size()-1)
		ores[x].is_crypto = true
		ores[x].get_child(0).texture = cryptotext
		crypto_ores.append(ores[x])
		ores.erase(ores[x])

func _delete_world():
	for i in get_child_count():
		get_child(i).queue_free()
