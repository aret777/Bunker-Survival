extends KinematicBody2D

var nameArr = ["Alko", "Tango", "Mike", "Sara", "Alex"]
var surnameArr = ["Smith", "Wolt", "Costa", "Page", "Snider"]
var healthArr = ["Healthy", "Astma", "Bad vision", "No left hand", "Altzheimer deceise"]

onready var Name = nameArr[GlobalVariables.RANDOM.randi_range(0,4)]
onready var Surname = surnameArr[GlobalVariables.RANDOM.randi_range(0,4)]
onready var Sex = GlobalVariables.RANDOM.randi_range(0,1)
onready var Age = GlobalVariables.RANDOM.randi_range(18,60)
onready var HP = GlobalVariables.RANDOM.randi_range(1,3)
onready var Str = GlobalVariables.RANDOM.randi_range(1,3)
onready var Dex = GlobalVariables.RANDOM.randi_range(1,3)
onready var Int = GlobalVariables.RANDOM.randi_range(1,3)
onready var Health = healthArr[GlobalVariables.RANDOM.randi_range(0,4)]

func _ready():
	pass # Replace with function body.

func _getName():
	return Name
	
func _getSurname():
	return Surname
	
func _getSex():
	return Sex
	
func _getAge():
	return Age

func _getHP():
	return HP

func _getStrength():
	return Str
	
func _getDexterity():
	return Dex
	
func _getIntellect():
	return Int
	
func _getHealth():
	return Health
	
	
func _on_BasicModel_input_event(_viewport, event, _shape_idx):
	if event.is_action_pressed("mouse_left_button") && GlobalVariables.UnitSelected == false:
		GlobalVariables.UnitSelected = true
		$NameLabel.set("custom_colors/font_color", Color(0,1,0))
		add_to_group("SelectedUnit")
		get_tree().call_group("UIGroup", "_show_char_info")
	
func _Desselected_Unit():
	$NameLabel.set("custom_colors/font_color", Color(1,1,1))
	remove_from_group("SelectedUnit")
	GlobalVariables.UnitSelected = false
#
#func _on_SelectionArea_selection_toggled(selection):
#
#	if selection: 
#		$NameLabel.set("custom_colors/font_color", Color(0,1,0))
#		add_to_group("SelectedUnit")
#	if !selection: 
#		$NameLabel.set("custom_colors/font_color", Color(1,1,1))
#		remove_from_group("SelectedUnit")
#
#	print("color change")
#	pass # Replace with function body.
	
	
	
	
