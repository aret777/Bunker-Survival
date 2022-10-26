extends Area2D

onready var namelabel = $NameLabel
onready var Destroyed = false
export (int) var RoomID #=GlobalVariables.RoomsObjectArray.find(self)
onready var RoomNames = ["EMPTY", "Air&Water", "Storage", "Entrance", "Reactor", "Restroom", "Dormitory", \
"Carpentry workshop", "Medical room", "Armory", "Garage", "Farm" ]

func _ready():
	var RoomObjArr = GlobalVariables.RoomsObjectArray
	#GlobalVariables.RoomsObjectArray.append(self)
	#RoomID = GlobalVariables.RoomsObjectArray.find(self)
	if RoomID >=1 && RoomID <=6:
		RoomObjArr[RoomID]=self
	else: 
		RoomID = 6+GlobalVariables.RANDOM.randi_range(1,3)
		while (RoomObjArr[RoomID] != null):
			RoomID = 6+GlobalVariables.RANDOM.randi_range(1,3)
		RoomObjArr[RoomID]=self
	
	namelabel.text = RoomNames[RoomID]
	#print("Array Room id is: ", RoomObjArr.find(self))
	match RoomID:#For beatiful grafick floor laying on top
		3,4,5: self.z_index = -1
		6,7,8: self.z_index = -2
	
	pass # Replace with function body.

func _on_RoomNode_input_event(_viewport, event, _shape_idx):
	var Human = GlobalVariables.HumanObjectArray[GlobalVariables.UnitSelected]

	if event.is_action_pressed("mouse_right_button") && GlobalVariables.IsSelected == true \
	&& GlobalVariables.UnitSelected != 0:
		Human._Desselected_Unit()
		Human.State = Human.DIRECTION.LEFT
		get_tree().call_group("UIGroup", "_hide_char_info")
	pass # Replace with function body.
