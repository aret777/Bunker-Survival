extends CanvasLayer

onready var CharInfo = $BunkerUI/CharInfoUI
onready var BunkerUI = $BunkerUI
	
func _ready():
	add_to_group("UIGroup")
	BunkerUI.set_position(Vector2(0,0))
	pass

func _input(_event):
	pass
	 #closing char menu on mouse click anywhere
#	if event is InputEventMouseButton:
#		if event.is_pressed():
#			if Input.is_action_pressed("mouse_left_button") && GlobalVariables.IsSelected:
#				get_tree().call_group("SelectedUnit", "_Desselected_Unit")
#				CharInfo.hide()
#			if Input.is_action_pressed("mouse_right_button") && GlobalVariables.IsSelected:
#				get_tree().call_group("SelectedUnit", "_Desselected_Unit")
#				CharInfo.hide()

func _show_char_info():
	CharInfo.show()
	
func _hide_char_info():
	CharInfo.hide()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
