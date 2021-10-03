extends Node2D

var h_range = 8
var v_range = 3

var enemies = []

var enemy_scene = preload("res://Scenes/Enemy.tscn")

func _spawn_enemies():
	var x_offset = 0
	var y_offset = 0
	for i in h_range:
		for j in v_range:
			var enemy = enemy_scene.instance()
			add_child(enemy)
			enemy.global_position = global_position + Vector2(x_offset,y_offset)
			y_offset += 16
			enemies.append(enemy)
		x_offset += 16
		y_offset = 0


func _delete_enemies():
	for i in get_child_count():
		if get_child(i).is_in_group("enemy"):
			get_child(i).queue_free()
