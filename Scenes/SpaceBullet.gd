extends Area2D

export(String) var group_to_kill
export(float) var speed

func _physics_process(delta):
	position += Vector2.UP * speed


func _on_Bullet_body_entered(body):
	if body.is_in_group(group_to_kill):
		body._damage()
	queue_free()
