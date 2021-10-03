extends KinematicBody2D

var bullet_scene = preload("res://Scenes/EnemyBullet.tscn")

func _ready():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	$Timer.wait_time = rng.randf_range(1,3)
	$Timer.start()
	add_to_group("enemy")

func _on_Timer_timeout():
	var b = bullet_scene.instance()
	get_parent().add_child(b)
	b.global_position = $Position2D.global_position
	
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	$Timer.wait_time = rng.randf_range(4,8)
	
	

func _damage():
	get_parent().enemies.erase(self)
	$AnimatedSprite.play("boom")
	yield(get_tree().create_timer(0.5), "timeout")
	queue_free()
