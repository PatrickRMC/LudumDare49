extends KinematicBody2D


var move_speed = 100
var bullet_scene = preload("res://Scenes/PlayerBullet.tscn")
var velocity = Vector2()
var health = 3
func _ready():
	add_to_group("player")
	
func _physics_process(delta):
	
	var movex = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	var movey = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	velocity = Vector2(movex * move_speed, movey * move_speed)
	velocity = move_and_slide(velocity)
	
	if Input.is_action_just_pressed("shoot"):
		var b = bullet_scene.instance()
		get_parent().add_child(b)
		b.global_position = global_position
		
func _damage():
	Globals.bills += 750
