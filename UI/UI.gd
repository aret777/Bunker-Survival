extends CanvasLayer

onready var CharInfo = $BunkerUI/CharInfoUI
onready var BunkerUI = $BunkerUI
onready var PopulationLabel = $BunkerUI/BunkerBar/HumanCounter
	
func _ready():
	add_to_group("UIGroup")
	BunkerUI.set_position(Vector2(0,0))
	pass

func _input(_event):
	pass

func _show_char_info():
	CharInfo.show()
	
func _hide_char_info():
	CharInfo.hide()

func _updateUI():
	GlobalVariables._set_population()
	PopulationLabel.text = str(GlobalVariables.Population) + "/10"
	
