extends StaticBody2D

var is_crypto = false


func _mine():
	if is_crypto:
		get_parent().get_parent().session_crypto += 1
	queue_free()
