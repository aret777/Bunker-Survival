extends Node2D

var Human = preload("res://ImagesObjects/BasicModel.tscn")
var NodePosition = self.get_position()
var Count = 0

func _ready():
	var timer = Timer.new()
	timer.connect("timeout",self,"_on_timer_timeout") 
	#timeout is what says in docs, in signals
	#self is who respond to the callback
	#_on_timer_timeout is the callback, can have any name
	add_child(timer) #to process
	timer.set_wait_time(0.5)
	timer.start() #to start

func _on_timer_timeout():
	if Count<5:
		var NewHuman = Human.instance()
		#NewHuman.position = Vector2(1470+Count*60, 450)
		NewHuman.position = NodePosition + Vector2(Count*60, 0)
		add_child(NewHuman)
		Count+=1
	else: 
		if (Count==5):
			Count+=1
			return print("SPAWN TIMER ENDED")
		else: return
