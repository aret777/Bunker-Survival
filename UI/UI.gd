extends CanvasLayer

onready var CharInfo = $CharInfoUI
	
func _ready():
	add_to_group("UIGroup")
	pass

func _input(event): #closing char menu on mouse click anywhere
	if event is InputEventMouseButton:
		if event.is_pressed():
			if Input.is_action_pressed("mouse_left_button") && GlobalVariables.UnitSelected:
				get_tree().call_group("SelectedUnit", "_Desselected_Unit")
				CharInfo.hide()
			if Input.is_action_pressed("mouse_right_button") && GlobalVariables.UnitSelected:
				get_tree().call_group("SelectedUnit", "_Desselected_Unit")
				CharInfo.hide()

func _show_char_info():
	CharInfo.show()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
