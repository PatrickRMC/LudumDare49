extends Control

export(Resource) var event_resource


func _ready():
	Globals.event_manager = self
	
func _new_event():
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
			rating_change = rng.randf_range(-1,1)
			
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
	
	print(event_text)
	var new_rating = Globals.company_rating[str(company)] + rating_change
	print(company + "old rating: " + str(Globals.company_rating[str(company)]) + " New rating: " + str(new_rating) + "\n")
	
	Globals.company_rating[str(company)] += rating_change
