extends Node2D

var ore_scene = preload("res://Scenes/CryptoOre.tscn")

var h_range = 8
var v_range = 5

func _init():
	_generate_world()

func _generate_world():
	var x_offset = 0
	var y_offset = 0
	for i in h_range:
		for j in v_range:
			var ore = ore_scene.instance()
			add_child(ore)
			ore.global_position = global_position + Vector2(x_offset,y_offset)
			y_offset += 16
		x_offset += 16
		y_offset = 0
