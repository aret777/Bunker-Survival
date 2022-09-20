extends KinematicBody2D

func _getSex():
	return GlobalVariables.RANDOM.randi_range(0,1)
	
func _getAge():
	return GlobalVariables.RANDOM.randi_range(18,60)

func _getHP():
	return GlobalVariables.RANDOM.randi_range(1,3)

func _getStrength():
	return GlobalVariables.RANDOM.randi_range(1,3)
	
func _getDexterity():
	return GlobalVariables.RANDOM.randi_range(1,3)
	
func _getIntellect():
	return GlobalVariables.RANDOM.randi_range(1,3)
	
func _getHealth():
	var healthArr = []
	healthArr = ["Healthy", "Astma", "Bad vision", 
	"No left hand", "Altzheimer deceise"]
	return healthArr[GlobalVariables.RANDOM.randi_range(0,4)]

# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
