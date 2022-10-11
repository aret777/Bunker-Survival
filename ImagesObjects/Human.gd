extends "res://ImagesObjects/BasicModel.gd"

onready var sprite = $Sprite
onready var namelabel = $NameLabel
onready var Selected = false
var AvatarID 
		
func _ready():
	namelabel.text = Name + " " + Surname[0] 
	if Sex==0:
		if Age >=50:
			AvatarID = 13
		else: 
			AvatarID = GlobalVariables.RANDOM.randi_range(0,12)
	if Sex==1: 
		if Age >=50:
			AvatarID = 20
		else: 
			AvatarID = GlobalVariables.RANDOM.randi_range(14,19)
		sprite.texture = load("res://Images/Woman.png")
	_CheckChars()
	
func _CheckChars():
	if Sex==0: 
		print("Male ", Age, " years and have ", Health, ". Chars are: ", HP, ", ", Str, ", ",
		Dex, ", ", Int, ". ID is: ", ID)
	if Sex==1: 
		print("Female ", Age, " years and have ", Health, ". Chars are: ", HP, ", ", Str, ", ",
		Dex, ", ", Int, ". ID is: ", ID)
		
func _getAvatarID():
	return AvatarID


