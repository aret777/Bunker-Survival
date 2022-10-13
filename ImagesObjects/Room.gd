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
	
	match RoomID:
		3,4,5: self.z_index = -1
		6,7,8: self.z_index = -2
	
	pass # Replace with function body.

