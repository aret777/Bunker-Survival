extends Node

var RANDOM

var is_zoomed = false
var UnitSelected = false
var UnitIDCounter = 0
var HumanObjectArray = []
	
func _ready():
	RANDOM = RandomNumberGenerator.new()
	RANDOM.randomize()
	#HumanObjectArray.append(null) #add 0 index to Human Object Array, as first person start from index 1
	pass # Replace with function body.

func _Set_UnitSelected(param):
	UnitSelected = param
	
