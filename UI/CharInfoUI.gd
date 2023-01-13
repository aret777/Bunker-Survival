extends Control

onready var NameSurname = $Name
onready var Age = $VBoxContainer2/Age
onready var Status = $VBoxContainer2/Status2
onready var Avatar = $Avatars
onready var HpBar = $VBoxContainer/VBoxContainer/HpBar
onready var StrBar = $VBoxContainer/VBoxContainer2/StrBar
onready var DexBar = $VBoxContainer/VBoxContainer/DexBar
onready var IntBar = $VBoxContainer/VBoxContainer2/IntBar

onready var ProfessionLabel = $List/ProfessionLabel
onready var HealthLabel = $List/HealthLabel
onready var FearLabel = $List/FearLabel
onready var HobbyLabel = $List/HobbyLabel
onready var ExtraLabel = $List/ExtraLabel

onready var InventoryHands = $Hands
onready var InventoryVest = $Vest
onready var InventoryShells = [$InventoryShell, $InventoryShell2, $InventoryShell3, $InventoryShell4, $InventoryShell5, $InventoryShell6]


func _ready():
	pass # Replace with function body.

func _on_CharInfoUI_draw():
	var Human = GlobalVariables.HumanObjectArray[GlobalVariables.UnitSelected]
	NameSurname.text = Human._getName() + " " + Human._getSurname()
	Age.text = String(Human.Age) + " years"
	Avatar.set_frame(Human._getAvatarID())
	Status.text = Human.Status
	
	HpBar.value = Human.HP
	StrBar.value = Human.Str
	DexBar.value = Human.Dex
	IntBar.value = Human.Int
	
	ProfessionLabel.text = Human.Profession
	HealthLabel.text = Human.Health
	FearLabel.text = Human.Fobia
	HobbyLabel.text = Human.Hobby
	ExtraLabel.text = Human.Extra
	
	for shells in InventoryShells: shells.hide()
	
	for i in range(Human.Str*2):
		InventoryShells[i].show()
		
	 
		
	if Human.Status != "Outside":
		$AcceptButton.hide()
		$DenieButton.hide()
	else: 
		$AcceptButton.show()
		$DenieButton.show()
	pass # Replace with function body.


func _on_CloseButton_pressed():
	get_tree().call_group("SelectedUnit", "_Desselected_Unit")
	self.hide()
	pass # Replace with function body.


func _on_AcceptButton_pressed():
	GlobalVariables.UnitOrdered = GlobalVariables.UnitSelected
	var Human = GlobalVariables.HumanObjectArray[GlobalVariables.UnitOrdered]
	Human.Selected = true
	Human.Status = "In rest room"
	get_tree().call_group("RoomsGroup", "_Move_to_Living_Room")
	get_tree().call_group("SelectedUnit", "_Desselected_Unit")
	get_tree().call_group("UIGroup", "_updateUI")
	self.hide()
	pass # Replace with function body.


func _on_DenieButton_pressed():
	var Human = GlobalVariables.HumanObjectArray[GlobalVariables.UnitSelected]
	#GlobalVariables.HumanObjectArray.remove(GlobalVariables.UnitSelected)
	Human.Status = "DECLINED"
	get_tree().call_group("SelectedUnit", "_Desselected_Unit")
	self.hide()
	Human.queue_free()
	#print("Array now is size: ", GlobalVariables.HumanObjectArray.size())
	pass # Replace with function body.
