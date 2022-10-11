extends Node

var Human = preload("res://ImagesObjects/Human.tscn")
var Bunker = preload("res://ImagesObjects/Room.tscn")

onready var CharInfoUI = $UI/CharInfoUI
onready var HumansSpawnPoint = $HumanSpawnPoint.get_position()
onready var RoomsSpawnPoint = $RoomsSpawnPoint.get_position()
var timer = Timer.new()
var i = 0

func _ready():
	CharInfoUI.hide()
	timer.connect("timeout",self,"_on_timer_timeout") 
	#timeout is what says in docs, in signals
	#self is who respond to the callback
	#_on_timer_timeout is the callback, can have any name
	add_child(timer) #to process
	timer.set_wait_time(0.5)
	timer.start() #to start
	
	for j in range (6):
		var NewRoom = Bunker.instance()
		if j<3:
			NewRoom.position = RoomsSpawnPoint + Vector2(j*450, 0)
		if j>=3 && i<6:
			NewRoom.position = RoomsSpawnPoint + Vector2((j-3)*450, 300)
		GlobalVariables.RoomsObjectArray.append(NewRoom) #First append on array, then add, cause add
		#works on _ready, but append before.
		add_child(NewRoom) #spawn on world
	pass # Replace with function body.

func _on_timer_timeout():
	var NewHuman = Human.instance()
	#NewHuman.position = Vector2(1470+Count*60, 450)
	NewHuman.position = HumansSpawnPoint + Vector2(i*100, 0)
	GlobalVariables.HumanObjectArray.append(NewHuman)
	add_child(NewHuman) #spawn on world
	i+=1
	if i == 6:
		timer.stop()


	
	
				
				
				
# ATTRIBUTION LICENCES
#https://itch.io/s/76779/casual-game-asset-bundle
#by https://sungraphica.itch.
#with https://creativecommons.org/faq/

#Fonts licence inside

#Attribution to Flaticon:
#https://support.flaticon.com/s/article/Attribution-How-when-and-where-FI?
#Attribution to Freepik:
#https://www.freepik.com/









