extends Node

var Human = preload("res://ImagesObjects/Human.tscn")

onready var StartSpawnPoint = $SpawnPoint.get_position()
var timer = Timer.new()
var i = 0

func _ready():
	$UI/CharInfoUI.hide()
	timer.connect("timeout",self,"_on_timer_timeout") 
	#timeout is what says in docs, in signals
	#self is who respond to the callback
	#_on_timer_timeout is the callback, can have any name
	add_child(timer) #to process
	timer.set_wait_time(0.5)
	timer.start() #to start
	pass # Replace with function body.

func _on_timer_timeout():
	var NewHuman = Human.instance()
	#NewHuman.position = Vector2(1470+Count*60, 450)
	NewHuman.position = StartSpawnPoint + Vector2(i*100, 0)
	add_child(NewHuman) #spawn on world
	GlobalVariables.HumanObjectArray.append(NewHuman)
	GlobalVariables.UnitIDCounter+=1
	i+=1
	if i == 5:
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









