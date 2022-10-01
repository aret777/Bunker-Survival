extends KinematicBody2D

var MnameArr = ["Alko", "Alex", "Daniel", "Jack", "Oliver", "Tomas", "Liam", "Mike", "Nolan", "Ryan"]
var FnameArr = ["Alice", "Bella", "Eovin", "Jess", "Lara", "Lily", "Ruby", "Sara", "Sofia", "Zoey", ]
var surnameArr = ["Ames", "Bangs", "Colt", "Costa", "Finch", "Johnson", "Page", "Snider", "Smith", "Wolt"]
var professionArr = ["Soldier", "Medic", "Engeneer", "Clerk", "CEO", \
"Veterinar", "Taxi Driver", "Physician", "Chemist", "Farmer"]
var healthArr = ["Healthy", "Astma", "Bad vision", "No left hand", "Altzheimer deceise"]
var fobiaArr = ["No fears", "Bibliofobia", "Agarofobia", "Autofobia", "Arahnofobia"]
var hobbyArr = ["Hunter", "Fishing", "Dancing", "Martial Arts", "StandUp"]
var extraArr = ["Vegetarian", "Beautiful", "Sadistic", "Nimfomaniac", "Pyroman"]

onready var ID = GlobalVariables.UnitIDCounter
var Name #created on ready
onready var Surname = surnameArr[GlobalVariables.RANDOM.randi_range(0,4)]
onready var Sex = GlobalVariables.RANDOM.randi_range(0,1)
onready var Age = GlobalVariables.RANDOM.randi_range(18,60)
onready var HP = GlobalVariables.RANDOM.randi_range(1,3)
onready var Str = GlobalVariables.RANDOM.randi_range(1,3)
onready var Dex = GlobalVariables.RANDOM.randi_range(1,3)
onready var Int = GlobalVariables.RANDOM.randi_range(1,3)
onready var Profession = professionArr[GlobalVariables.RANDOM.randi_range(0,9)]
onready var Health = healthArr[GlobalVariables.RANDOM.randi_range(0,4)]
onready var Fobia = fobiaArr[GlobalVariables.RANDOM.randi_range(0,4)]
onready var Hobby = hobbyArr[GlobalVariables.RANDOM.randi_range(0,4)]
onready var Extra = extraArr[GlobalVariables.RANDOM.randi_range(0,4)]

func _ready():
	if Sex == 0: Name = MnameArr[GlobalVariables.RANDOM.randi_range(0,9)] #male
	if Sex == 1: Name = FnameArr[GlobalVariables.RANDOM.randi_range(0,9)] #female
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
	if event.is_action_pressed("mouse_left_button") && GlobalVariables.IsSelected == false:
		GlobalVariables.IsSelected = true
		GlobalVariables.UnitSelected = ID
		$NameLabel.set("custom_colors/font_color", Color(0,1,0))
		add_to_group("SelectedUnit")
		get_tree().call_group("UIGroup", "_show_char_info")
	
func _Desselected_Unit():
	$NameLabel.set("custom_colors/font_color", Color(1,1,1))
	remove_from_group("SelectedUnit")
	GlobalVariables.IsSelected = false
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
	
	
	
	
