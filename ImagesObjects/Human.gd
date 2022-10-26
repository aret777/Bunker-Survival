extends "res://ImagesObjects/BasicModel.gd"


onready var Selected = false
var AvatarID 
var SpriteNumber = 1 #GlobalVariables.RANDOM.randi_range(1,3)
var Status = "Outside"

func _ready():
	namelabel.text = Name + " " + Surname[0]
	#sprite.texture = load() #Load Idle
	
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

#func _physics_process(_delta):
#	match State: 
#		DIRECTION.RIGHT:
#			motion.x = MAX_SPEED
#			if not FloorRight.is_colliding() or WallRight.is_colliding():
#				State = DIRECTION.LEFT
#		DIRECTION.LEFT:
#			motion.x = -MAX_SPEED
#			if not FloorLeft.is_colliding() or WallLeft.is_colliding():
#				State = DIRECTION.RIGHT
#		DIRECTION.IDLE:
#			motion.x = 0
#	sprite.scale.x = sign(motion.x)
#	motion = move_and_slide_with_snap(motion, Vector2.DOWN * 4, Vector2.UP, true, 4, deg2rad(46))

	
func _CheckChars():
	if Sex==0: 
		print("Male ", Age, " years and have ", Health, ". Chars are: ", HP, ", ", Str, ", ",
		Dex, ", ", Int, ". ID is: ", ID)
	if Sex==1: 
		print("Female ", Age, " years and have ", Health, ". Chars are: ", HP, ", ", Str, ", ",
		Dex, ", ", Int, ". ID is: ", ID)
		
func _getAvatarID():
	return AvatarID



