extends Area2D

#signal selection_toggled(selection)
#
#export var exclusive = true
#export var selection_action = "select"
#
#func _set_selected(selection):
#	if selection:
#		_make_exclusive()
#		add_to_group("selected")
#	else:
#		remove_from_group("selected")
#	GlobalVariables.selected = selection
#	emit_signal("selection_toggled", GlobalVariables.selected)
#
#func _make_exclusive():
#	if not exclusive:
#		return
#	get_tree().call_group("selected", "set_selected", false)
	
#func _input_event(_viewport, event, _shape_idx):
#	if event.is_action_pressed("mouse_left_button") && GlobalVariables.selected == false:
#		GlobalVariables.selected = true
#		emit_signal("selection_toggled", GlobalVariables.selected)
#

