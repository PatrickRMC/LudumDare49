extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


func _process(delta):
	if visible:
		$AnimationPlayer.play("Ads")
