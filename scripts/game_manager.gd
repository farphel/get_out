extends Node

var escapes: int = 0
var number_of_attempts: int = 0

func get_stats_text() -> String:
	if number_of_attempts == 0: return "0/0 [0%]"
	var percentage = (float(escapes) / number_of_attempts) * 100
	return "%d/%d [%d]" % [escapes, number_of_attempts, percentage]
