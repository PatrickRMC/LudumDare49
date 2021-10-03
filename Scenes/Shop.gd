extends Control



func _buy_upgrade(x):
	
	match x:
		"CheapMining":
			if Globals.balance >= $ScrollContainer/VBoxContainer/BetterMiningCard.cost:
				Globals.balance -= $ScrollContainer/VBoxContainer/BetterMiningCard.cost
				Globals.mine_cost = 350
				$ScrollContainer/VBoxContainer/BetterMiningCard.visible = false
		"LessProblems":
			if Globals.balance >= $ScrollContainer/VBoxContainer/LessProblemCard.cost:
				Globals.balance -= $ScrollContainer/VBoxContainer/LessProblemCard.cost
				Globals.problem_delay += 10
				Globals.problem_multiplier = 2
				$ScrollContainer/VBoxContainer/LessProblemCard.visible = false
