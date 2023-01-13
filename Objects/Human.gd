extends "res://Objects/BasicModel.gd"


onready var Selected = false
var path : = PoolVector2Array() setget _set_path #fynkciya vnizy
var AvatarID 
var SpriteNumber
var Status = "Outside"

func _ready():
	namelabel.text = Name + " " + Surname[0]
	SpriteNumber = GlobalVariables.RANDOM.randi_range(1,3)
	
	if Sex==0: #male
		if Age >=50:
			AvatarID = 13
		else: 
			AvatarID = GlobalVariables.RANDOM.randi_range(0,12)
		sprite.texture = load("res://Images/Man"+str(SpriteNumber)+".png")
		
	if Sex==1: #female
		if Age >=50:
			AvatarID = 20
		else: 
			AvatarID = GlobalVariables.RANDOM.randi_range(14,19)
		sprite.texture = load("res://Images/Woman"+str(SpriteNumber)+".png")
				
	_CheckChars()
	#movement next, base made on BasicModel
	set_process(false)
	
func _CheckChars():
	if Sex==0: 
		print("Male ", Age, " years and have ", Health, ". Chars are: ", HP, ", ", Str, ", ",
		Dex, ", ", Int, ". ID is: ", ID)
	if Sex==1: 
		print("Female ", Age, " years and have ", Health, ". Chars are: ", HP, ", ", Str, ", ",
		Dex, ", ", Int, ". ID is: ", ID)
		
func _getAvatarID():
	return AvatarID

func _physics_process(delta): #movement
		var distance : float = MAX_SPEED * delta
		_move_along_path(distance)
		
func _set_path(value : PoolVector2Array) -> void:
	path = value
	if value.size() == 0:
		return
	set_process(true)
	
func _move_along_path (distance : float) -> void:
	var start_point : = position
	for i in range(path.size()):
		var distance_to_next : = start_point.distance_to(path[0])
		if distance <= distance_to_next and distance >= 0.0:
			position = start_point.linear_interpolate(path[0], distance / distance_to_next)
			spriteAnimator.play("Walk")
			break
		elif distance < 0.0:
			position = path[0]
			set_process(false)
			break
		distance -= distance_to_next
		start_point = path[0]
		path.remove(0)
		if i == path.size(): 
			spriteAnimator.play("Idle")
	



