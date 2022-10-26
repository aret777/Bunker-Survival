extends KinematicBody2D

export (int) var ACCELERATION = 512
export (int) var MAX_SPEED = 500
export (float) var FRICTION = 0.25
var motion = Vector2.ZERO

onready var sprite = $Sprite
onready var spriteAnimator = $AnimationPlayer
onready var namelabel = $NameLabel
enum DIRECTION {LEFT = -1, RIGHT = -1, IDLE = 0}
export (DIRECTION) var WALKING_DIRECTION
var State 
onready var FloorLeft = $FloorLeft
onready var FloorRight = $FloorRight
onready var WallRight = $WallRight
onready var WallLeft = $WallLeft

var MnameArr = ["Alko", "Alex", "Daniel", "Jack", "Oliver", "Tomas", "Liam", "Mike", "Nolan", "Ryan"]
var FnameArr = ["Alice", "Bella", "Eovin", "Jess", "Lara", "Lily", "Ruby", "Sara", "Sofia", "Zoey", ]
var surnameArr = ["Ames", "Bangs", "Colt", "Costa", "Finch", "Johnson", "Page", "Snider", "Smith", "Wolt"]
var professionArr = ["Soldier", "Medic", "Engeneer", "Clerk", "CEO", \
"Veterinar", "Taxi Driver", "Physician", "Chemist", "Farmer"]
var healthArr = ["Healthy", "Astma", "Bad vision", "Diabetes", "Altzheimer"]
var fobiaArr = ["No fears", "Bibliofobia", "Agarofobia", "Autofobia", "Arahnofobia"]
var hobbyArr = ["Hunter", "Fishing", "Dancing", "Martial Arts", "StandUp"]
var extraArr = ["Vegetarian", "Beautiful", "Sadistic", "Nimfomaniac", "Pyroman"]

var Name #created on ready
onready var ID = GlobalVariables.HumanObjectArray.find(self)
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
	sprite.set_flip_h(true)
	#State = WALKING_DIRECTION
	
	if Age >=50: #aging
		if HP==3: HP = GlobalVariables.RANDOM.randi_range(1,2)
		if Str==3: Str = GlobalVariables.RANDOM.randi_range(1,2)
		if Dex==3: Dex = GlobalVariables.RANDOM.randi_range(1,2)
	if Age <=23:
		if Int==3: Int = GlobalVariables.RANDOM.randi_range(1,2)
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
	
func _physics_process(delta): #movement
	if GlobalVariables.UnitSelected == ID:
		var input_vector = Vector2.ZERO
		input_vector.x = Input.get_action_strength("Key D") - Input.get_action_strength("Key A")
		input_vector.y = Input.get_action_strength("Key S") - Input.get_action_strength("Key W")
		
			
		if input_vector != Vector2.ZERO: #if equal to zero, we are not pressing anything
			motion += input_vector * ACCELERATION * delta
			motion = motion.limit_length(MAX_SPEED) #prevent us to move very quickly
		else:
			motion = motion.linear_interpolate(Vector2.ZERO, FRICTION)
			
		motion = move_and_slide(motion)
		_Update_Animations(input_vector)
		
func _Movement(how_much_move):
	var input_vector = Vector2.ZERO
	input_vector = how_much_move

	if input_vector != Vector2.ZERO: #if equal to zero, we are not pressing anything
		motion += input_vector * ACCELERATION
		motion = motion.limit_length(MAX_SPEED) #prevent us to move very quickly
	else:
		motion = motion.linear_interpolate(Vector2.ZERO, FRICTION)
	motion = move_and_slide(motion)

func _Update_Animations(input_vector):
	if input_vector.x != 0:
		if input_vector.x > 0:
			sprite.set_flip_h(false)
		if input_vector.x < 0:
			sprite.set_flip_h(true)
		spriteAnimator.play("Walk")
	else:
		spriteAnimator.play("Idle")




func _on_BasicModel_input_event(_viewport, event, _shape_idx): #selection of unit
	var Human = GlobalVariables.HumanObjectArray[GlobalVariables.UnitSelected]

	if event.is_action_pressed("mouse_left_button") && GlobalVariables.IsSelected == false:
		GlobalVariables.IsSelected = true
		GlobalVariables.UnitSelected = ID
		$NameLabel.set("custom_colors/font_color", Color(0,1,0))
		add_to_group("SelectedUnit")
		get_tree().call_group("UIGroup", "_show_char_info")
		#print("Selected ID is: ", GlobalVariables.UnitSelected)
	if event.is_action_pressed("mouse_left_button") && GlobalVariables.IsSelected == true \
	&& GlobalVariables.UnitSelected != ID:
		Human._Desselected_Unit()
		GlobalVariables.IsSelected = true
		GlobalVariables.UnitSelected = ID
		$NameLabel.set("custom_colors/font_color", Color(0,1,0))
		add_to_group("SelectedUnit")
		get_tree().call_group("UIGroup", "_hide_char_info")
		get_tree().call_group("UIGroup", "_show_char_info")
		
func _Desselected_Unit():
	$NameLabel.set("custom_colors/font_color", Color(1,1,1))
	remove_from_group("SelectedUnit")
	GlobalVariables.IsSelected = false
	GlobalVariables.UnitSelected = 0
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
	
	
	
	
