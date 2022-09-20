extends "res://ImagesObjects/BasicModel.gd"

onready var sprite = $Sprite
export (int) var ID
export (int) var sex = _getSex()
export (int) var age = _getAge()
export (int) var HP = _getHP()
export (int) var Str = _getStrength()
export (int) var Dex = _getDexterity()
export (int) var Int = _getIntellect()
export (int) var health = _getHealth()

func _CheckChars():
	if sex==0: 
		print("Male ", age, " years and have ", health, ". Chars are: ", HP, ", ", Str, ", ",
		Dex, ", ", Int, ". ID is: ", ID)
	if sex==1: 
		sprite.texture = load("res://Images/Woman.png")
		print("Female ", age, " years and have ", health, ". Chars are: ", HP, ", ", Str, ", ",
		Dex, ", ", Int, ". ID is: ", ID)
		
		
func _ready():
	#adding personal ID to human
	GlobalVariables.UnitIDCounter += 1
	ID = GlobalVariables.UnitIDCounter
	_CheckChars()
