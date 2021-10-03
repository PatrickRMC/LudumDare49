extends Control


var pausedDay = false
var pausedEvent = false

func _init():
	Globals.calendar = self

func _on_EventTimer_timeout():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	Globals.event_manager._new_event()
	$EventTimer.wait_time = rng.randf_range(6,10)
	$EventTimer.start()

func _process(delta):
	$EventTimer.paused = pausedEvent
	$DayTimer.paused = pausedDay

func _on_DayTimer_timeout():
	get_parent()._new_day()
	$EventTimer.stop()

func _start_day_timer():
	$DayTimer.start()
	$EventTimer.start()
