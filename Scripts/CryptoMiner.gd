extends KinematicBody2D

var active = true
var crypto_count = 0

func _process(delta):
	if not active:
		return
	
	if Input.is_action_just_pressed("crypto_up"):
		_move(0,-1)
	elif Input.is_action_just_pressed("crypto_down"):
		_move(0,1)
	elif Input.is_action_just_pressed("crypto_left"):
		_move(-1,0)
	elif Input.is_action_just_pressed("crypto_right"):
		_move(1,0)
		
	if $OreRay.is_colliding():
		if $OreRay.get_collider():
			$OreRay.get_collider()._mine()
		
func _move(x,y):
	if Globals.balance >= 1000:
		Globals.balance -= 1000
		$OreRay.cast_to = Vector2(x*4,y*4)
		global_position += Vector2(x*16,y*16)
