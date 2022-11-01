extends Node

var RANDOM

var is_zoomed = false
var UnitSelected = 0 #id of unit
var IsSelected = false
var UnitOrdered = 0 #acumulating IDs of units that received orders
var HumanObjectArray = [] #Spawned on World.gd
var RoomsObjectArray = []
var Population = 0

onready var nav_2d: Navigation2D 
	
func _ready():
	RANDOM = RandomNumberGenerator.new()
	RANDOM.randomize()
	RoomsObjectArray.resize(100)
	RoomsObjectArray.fill(null)
	HumanObjectArray.append(null) #add 0 index to Human Object Array, as first person start from index 1
	
	pass # Replace with function body.

func _set_population():
	Population = 0
	for i in HumanObjectArray.size():
		if HumanObjectArray[i] != null && HumanObjectArray[i].Status != "Outside":
			Population += 1
	
