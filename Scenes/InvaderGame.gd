extends Node2D

var active
var won

func _start_game():
	get_parent().find_node("StartScreen").visible = false
	active = true
	$EnemyContainer.enemies = []
	$EnemyContainer._spawn_enemies()
	$EnemyContainer/AnimationPlayer.play("Enemies")
	$Ship.position = Vector2(0,0)

func _process(delta):
	if not active:
		return
	if not won and $EnemyContainer.enemies.size() <= 0:
		won = true
		var rng = RandomNumberGenerator.new()
		rng.randomize()
		var c = rng.randi_range(1,3)
		Globals.crypto_count += c
		$WinPanel/Label.text = "You won " + str(c) + " crypto"
		$WinPanel.visible = true
		yield(get_tree().create_timer(1.5), "timeout")
		_end_game()

func _end_game():
	$WinPanel.visible = false
	active = false
	won = false
	get_parent().find_node("StartScreen").visible = true
	$Ship.position = Vector2(0,0)
	$EnemyContainer.enemies = []
	$EnemyContainer._delete_enemies()
