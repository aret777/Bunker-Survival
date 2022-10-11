extends Area2D

onready var namelabel = $NameLabel
onready var Destroyed = false
onready var RoomID = GlobalVariables.RoomsObjectArray.find(self)
onready var RoomNames = ["Air&Water", "Storage", "Entrance", "Reactor", "Restroom", "Dormitory"]

func _ready():
	#print("Room id is: ", RoomID)
	namelabel.text = RoomNames[RoomID]
	pass # Replace with function body.

