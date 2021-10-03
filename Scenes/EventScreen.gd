extends Control

export(Resource) var event_resource

var pause

func _ready():
	Globals.event_manager = self
	
func _new_event():
	if pause:
		return
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var company = event_resource.companies[rng.randi_range(0,event_resource.companies.size()-1)]
	var event  = event_resource.event[rng.randi_range(0,event_resource.event.size()-1)]
	var react = event_resource.PUBLIC_REACTION
	react = rng.randi_range(0, event_resource.PUBLIC_REACTION.size() - 1)
	
	var reaction_text = ""
	var rating_change = 0
	
	match react:
		event_resource.PUBLIC_REACTION.neutral:
			reaction_text = "The public is neutral about this."
			rating_change = rng.randf_range(-3,3)
			
		event_resource.PUBLIC_REACTION.positive:
			reaction_text = event_resource.positive_responses[rng.randi_range(0,event_resource.positive_responses.size()-1)]
			rating_change = rng.randf_range(-1,4)
			
		event_resource.PUBLIC_REACTION.negative:
			reaction_text = event_resource.negative_responses[rng.randi_range(0,event_resource.negative_responses.size()-1)]
			rating_change = rng.randf_range(-4,1)
		_:
			reaction_text = "The public is neutral about this."
			
	var event_text = company + " " + event + ". " + reaction_text
	
	$Panel/CompanyLabel.text = company
	$Panel/EventLabel.text = event_text
	
	var company_worth = Globals.company_worth[str(company)]
	var company_rating = Globals.company_rating[str(company)]

	print(event_text)
	var new_rating = rating_change
	
	print(company + "old rating: " + str(company_rating) + " New rating: " + str(new_rating) + "\n")
	

	for i in event_resource.companies:
		Globals.company_worth[str(i)] += Globals.company_rating[str(i)] * rng.randf_range(20,80)
		Globals.company_worth[str(i)] = stepify(Globals.company_worth[str(i)], 0.5)
		if Globals.company_worth[str(i)] <= 0:
			Globals.company_worth[str(i)] = 0

	company_worth += new_rating * rng.randf_range(30,100)
	Globals.company_worth[str(company)] = stepify(company_worth, 0.5)
	if Globals.company_worth[str(company)] <= 0:
		Globals.company_worth[str(company)] = 0
	company_rating = new_rating 
	Globals.company_rating[str(company)] = stepify(company_rating, 0.5)
	visible = true
	print(Globals.company_worth[str(company)])
	yield(get_tree().create_timer(4),"timeout")
	visible = false


func _close_noti():
	visible = false
