extends "res://ImagesObjects/BasicModel.gd"

onready var sprite = $Sprite
export (int) var sex = _getSex()
export (int) var age = _getAge()
export (int) var health = _getHealth()

func _CheckChars():
	if sex==0: 
		print("Male ", age, " years and have ", health, " по русски")
	if sex==1: 
		sprite.texture = load("res://Images/Woman.png")
		print("Female ", age," years and have ", health, " по русски")
		
		
func _ready():
	_CheckChars()
