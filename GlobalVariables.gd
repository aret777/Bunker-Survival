extends Node

var RANDOM

var is_zoomed = false
var UnitSelected = 0
var IsSelected = false
var HumanWaiting = []
var HumanObjectArray = []
var RoomsObjectArray = []

	
func _ready():
	RANDOM = RandomNumberGenerator.new()
	RANDOM.randomize()
	RoomsObjectArray.resize(100)
	RoomsObjectArray.fill(null)
	#HumanObjectArray.append(null) #add 0 index to Human Object Array, as first person start from index 1
	pass # Replace with function body.

func _Set_UnitSelected(param):
	UnitSelected = param
	
