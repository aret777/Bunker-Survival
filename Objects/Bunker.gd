extends Area2D

onready var namelabel = $NameLabel
onready var PositionsToStay = [$PositionToStay1, $PositionToStay2, $PositionToStay3, $PositionToStay4]
onready var PositionsArray = [false, false, false, false] #if positions empty or not
onready var Position
onready var Destroyed = false
export (int) var RoomID 
onready var RoomNames = ["EMPTY", "Air&Water", "Storage", "Entrance", "Reactor", "Restroom", "Dormitory", \
"Carpentry workshop", "Medical room", "Armory", "Garage", "Farm" ]

func _ready():
	add_to_group("RoomsGroup")
	var RoomObjArr = GlobalVariables.RoomsObjectArray
	#GlobalVariables.RoomsObjectArray.append(self)
	#RoomID = GlobalVariables.RoomsObjectArray.find(self)
	if RoomID >=1 && RoomID <=6: #starting rooms generation and insertion
		RoomObjArr[RoomID]=self
	else: #random room generation
		RoomID = 6+GlobalVariables.RANDOM.randi_range(1,3)
		while (RoomObjArr[RoomID] != null):
			RoomID = 6+GlobalVariables.RANDOM.randi_range(1,3)
		RoomObjArr[RoomID]=self
	
	namelabel.text = RoomNames[RoomID]
	#print("Array Room id is: ", RoomObjArr.find(self))
	pass # Replace with function body.

func _on_RoomNode_input_event(_viewport, event, _shape_idx):
	GlobalVariables.UnitOrdered = GlobalVariables.UnitSelected
	var Human = GlobalVariables.HumanObjectArray[GlobalVariables.UnitOrdered]

	if event.is_action_pressed("mouse_right_button") && GlobalVariables.IsSelected == true \
	&& GlobalVariables.UnitSelected != 0 && Human.Status != "Outside":
		Human._Desselected_Unit()
		get_tree().call_group("UIGroup", "_hide_char_info")
		if _positionsCheck() == true:
			var new_path : = Navigation2DServer.map_get_path(GlobalVariables.nav_2d.get_rid(), \
			Human.global_position, PositionsToStay[Position].global_position, true)	
			Human.path = new_path
		else: print("ROOM FULL")
	pass # Replace with function body.
	
func _Move_to_Living_Room(): #Living room unique where humans got extra space
	var Human = GlobalVariables.HumanObjectArray[GlobalVariables.UnitOrdered]
	var new_path : = Navigation2DServer.map_get_path(GlobalVariables.nav_2d.get_rid(), \
		Human.global_position, GlobalVariables.RoomsObjectArray[5].PositionsToStay[GlobalVariables.RANDOM.randi_range(0,3)].global_position, true)
	Human.path = new_path

func _positionsCheck():
	var Human = GlobalVariables.HumanObjectArray
	PositionsArray = [false, false, false, false]
			
	for j in Human.size(): #check if Human stays on point already, reload of PositionsArray
		if Human[j] != null: 
			for x in PositionsToStay.size():
#				print ("Human number " + str(j) +" global position is: " + \
#				str(Human[j].global_position) + " and " + str((PositionsToStay[x].global_position)) )
#
				if (((Human[j].global_position).length() - (PositionsToStay[x].global_position).length()) <= 5) && \
				(((Human[j].global_position).length() - (PositionsToStay[x].global_position).length()) >= -5): 
					#difference between points around 5 pixels
					#print ("Found person at position " + str(x))
					PositionsArray[x] = true
				if Human[j].path.has(PositionsToStay[x].global_position): #somebody who already goes there
					#print ("Somebody goes already to position " + str(x))
					PositionsArray[x] = true
	
	var FullCheck = 0
#	for z in PositionsArray.size():
#		print ("Position is occupied? " + str(PositionsArray[z]))
	for i in PositionsArray.size():
		if PositionsArray[i] == false:
			Position = i
			PositionsArray[i] = true
			return true
		if PositionsArray[i] == true:
			FullCheck += 1
		if FullCheck == 4:
			return false
			
	
	

