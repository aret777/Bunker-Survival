extends Timer

var Human = preload("res://ImagesObjects/BasicModel.tscn")
var Count = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Timer_timeout():
	if Count<5:
		var NewHuman = Human.instance()
		NewHuman.position = Vector2(400+Count*60, 380)
		add_child(NewHuman)
		Count+=1
		#print(Count)
	else: 
		if (Count==5):
			Count+=1
			return print("TIMER ENDED")
		else: return
