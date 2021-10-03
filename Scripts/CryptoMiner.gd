extends KinematicBody2D

var active = false
var crypto_count = 0

func _process(delta):
	if not active:
		return
	
	if Input.is_action_just_pressed("move_up"):
		_move(0,-1)
	elif Input.is_action_just_pressed("move_down"):
		_move(0,1)
	elif Input.is_action_just_pressed("move_left"):
		_move(-1,0)
	elif Input.is_action_just_pressed("move_right"):
		_move(1,0)
	
	if $OreRay.is_colliding():
		if $OreRay.get_collider():
			$OreRay.get_collider()._mine()
		
func _move(x,y):
		Globals.bills += Globals.mine_cost
		$OreRay.cast_to = Vector2(x*4,y*4)
		global_position += Vector2(x*16,y*16)
		$AnimatedSprite.frame = 0
		$AnimatedSprite.play("Mine")
