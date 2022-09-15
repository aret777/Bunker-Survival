extends KinematicBody2D

func _getSex():
	return GlobalVars.RANDOM.randi_range(0,1)
	
func _getAge():
	return GlobalVars.RANDOM.randi_range(18,60)

func _getHP():
	return GlobalVars.RANDOM.randi_range(1,3)

func _getStrength():
	return GlobalVars.RANDOM.randi_range(1,3)
	
func _getDexterity():
	return GlobalVars.RANDOM.randi_range(1,3)
	
func _getIntellect():
	return GlobalVars.RANDOM.randi_range(1,3)
	
func _getHealth():
	var healthArr = []
	healthArr = ["Healthy", "Astma", "Bad vision", 
	"No left hand", "Altzheimer deceise"]
	return healthArr[GlobalVars.RANDOM.randi_range(0,4)]

# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
