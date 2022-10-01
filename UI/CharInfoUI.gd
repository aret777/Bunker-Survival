extends Control

onready var NameSurname = $Name
onready var Age = $VBoxContainer2/Age
onready var Avatar = $Avatars
onready var HpBar = $VBoxContainer/VBoxContainer/HpBar
onready var StrBar = $VBoxContainer/VBoxContainer2/StrBar
onready var DexBar = $VBoxContainer/VBoxContainer/DexBar
onready var IntBar = $VBoxContainer/VBoxContainer2/IntBar


func _ready():
	pass # Replace with function body.

func _on_CharInfoUI_draw():
	var Human = GlobalVariables.HumanObjectArray[GlobalVariables.UnitSelected]
	
	NameSurname.text = Human._getName() + " " + Human._getSurname()
	Age.text = String(Human.Age) + " years"
	Avatar.set_frame(Human._getAvatarID())
	
	
	
	
	
	HpBar.value = Human.HP
	StrBar.value = Human.Str
	DexBar.value = Human.Dex
	IntBar.value = Human.Int
	pass # Replace with function body.
