extends Panel

export(float) var cost

func _process(delta):
	$Label3.text = "Cost: $" + str(cost)
