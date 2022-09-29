extends "res://ImagesObjects/BasicModel.gd"

onready var sprite = $Sprite
onready var namelabel = $NameLabel
export (int) var ID
		
func _ready():
	namelabel.text = Name + " " + Surname[0] 
	#adding personal ID to human
	ID = GlobalVariables.UnitIDCounter
	_CheckChars()
	
func _CheckChars():
	if Sex==0: 
		print("Male ", Age, " years and have ", Health, ". Chars are: ", HP, ", ", Str, ", ",
		Dex, ", ", Int, ". ID is: ", ID)
	if Sex==1: 
		sprite.texture = load("res://Images/Woman.png")
		print("Female ", Age, " years and have ", Health, ". Chars are: ", HP, ", ", Str, ", ",
		Dex, ", ", Int, ". ID is: ", ID)
		



